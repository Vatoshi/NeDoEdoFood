package kg.attractor.nedoedofood.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kg.attractor.nedoedofood.dto.CartDto;
import kg.attractor.nedoedofood.model.Cart.CartItem;
import kg.attractor.nedoedofood.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
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
        List<CartItem> cart = userService.getListFromCookie(request);

        boolean alreadyExists = false;
        for (CartItem cartItem : cart) {
            if (cartItem.getId().equals(dishId)) {
                alreadyExists = true;
                break;
            }
        }

        if (!alreadyExists) {
            CartItem item = new CartItem();
            item.setId(dishId);
            item.setQuantity(1);
            cart.add(item);
        }

        userService.setCartCookie(response, cart);
        return "redirect:/restik?id=" + restId + "&page=" + page;
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

    @PostMapping("move")
    public String minus (@RequestParam("id") Long id,
                         @RequestParam("move") String move,
                         HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
        List<CartItem> items = userService.getListFromCookie(request);

        if (move.equals("minus")) {
            items = userService.minusQuantity(items, id);
        } else if (move.equals("plus")) {
            items = userService.plusQuantity(items, id);
        } else if (move.equals("delete")) {
            items = userService.deleteDish(items, id);
        }

        userService.setCartCookie(response, items);
        return "redirect:/user/bascket";
    }

    @PostMapping("createOrder")
    public String createOrder(HttpServletRequest request, HttpServletResponse response,Authentication auth) throws JsonProcessingException, UnsupportedEncodingException {
        List<CartItem> items = userService.getListFromCookie(request);
        userService.createOrder(items,auth.getName());
        Cookie cookie = new Cookie("cart", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        return "error/redirect";
    }

    @GetMapping("orders")
    public String getOrders(Model model, Authentication auth) {
        model.addAttribute("user", userService.getUserByEmail(auth.getName()));
        model.addAttribute("orders", userService.getUserOrders(auth.getName()));
        return "main/order";
    }

    @GetMapping("information")
    public String getInformation(Model model, Authentication auth) {
        model.addAttribute("user", userService.getUserByEmail(auth.getName()));
        model.addAttribute("us", userService.getUser(auth.getName()));
        return "main/user";
    }

}
