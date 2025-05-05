package kg.attractor.nedoedofood.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kg.attractor.nedoedofood.dto.CartDto;
import kg.attractor.nedoedofood.model.Cart.CartItem;
import kg.attractor.nedoedofood.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("user")
public class UserElementsController {

    private final UserService userService;

    @GetMapping("add")
    public String addToCart(@RequestParam("id") Long dishId,
                            @RequestParam("rest") Long restId,
                            @RequestParam("page") int page,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        ObjectMapper mapper = new ObjectMapper();
        List<CartItem> cart = new ArrayList<>();

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("cart".equals(c.getName())) {
                    String value = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
                    cart = mapper.readValue(value, new TypeReference<List<CartItem>>() {});
                    break;
                }
            }
        }

        CartItem item = new CartItem();
        item.setId(dishId);
        item.setQuantity(1);
        cart.add(item);

        String json = mapper.writeValueAsString(cart);
        Cookie cookie = new Cookie("cart", java.net.URLEncoder.encode(json, "UTF-8"));
        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(cookie);

        return "redirect:/restik?id=" + restId + "&page=" + page + "&dishAdded=" + dishId;
    }

    @GetMapping("bascket")
    public String getCart(Model model, HttpServletRequest request, Authentication auth){
        if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
            model.addAttribute("user", userService.getUserByEmail(auth.getName()));
        } else {
            model.addAttribute("user", null);
        }
        Cookie[] cookies = request.getCookies();
        try {
            List<CartDto> dishes = userService.getDishesForCarts(cookies);
            int sum = dishes.stream()
                    .mapToInt(d -> d.getQuantity() * d.getPrice())
                    .sum();
            model.addAttribute("carts", dishes);
            model.addAttribute("total", sum);
        } catch (Exception e) {
            model.addAttribute("carts", null);
        }
        return "main/bascket";
    }

    @GetMapping("move")
    public String minus (@RequestParam("id") Long id,
                         @RequestParam("move") String move,
                         HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
        ObjectMapper mapper = new ObjectMapper();
        List<CartItem> items = new ArrayList<>();
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            if ("cart".equals(c.getName())) {
                String value = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
                items = mapper.readValue(value, new TypeReference<List<CartItem>>() {});
                break;
            }
        }
        if (move.equals("minus")) {
            items = userService.minusQuantity(items, id);
        } else if (move.equals("plus")) {
            items = userService.plusQuantity(items, id);
        } else if (move.equals("delete")) {
            items = userService.deleteDish(items, id);
        }

        String updatedJson = mapper.writeValueAsString(items);
        Cookie newCookie = new Cookie("cart", java.net.URLEncoder.encode(updatedJson, "UTF-8"));
        newCookie.setPath("/");
        newCookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(newCookie);
        return "redirect:/user/bascket";
    }
}
