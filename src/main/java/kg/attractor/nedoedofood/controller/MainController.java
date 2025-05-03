package kg.attractor.nedoedofood.controller;

import jakarta.servlet.http.HttpSession;
import kg.attractor.nedoedofood.model.Cart.CartItem;
import kg.attractor.nedoedofood.model.Store;
import kg.attractor.nedoedofood.service.DishService;
import kg.attractor.nedoedofood.service.StoreService;
import kg.attractor.nedoedofood.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import static jdk.internal.org.jline.reader.impl.LineReaderImpl.CompletionType.List;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {
    private final StoreService storeService;
    private final UserService userService;
    private final DishService dishService;

    @GetMapping
    public String mainPage(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String search,
            Model model,
            Authentication auth
    ) {
        model.addAttribute("search", search);
        model.addAttribute("category", category);
        model.addAttribute("page", page);

        Pageable pageable = PageRequest.of(page, 5);

        if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
            model.addAttribute("user", userService.getUserByEmail(auth.getName()));
        } else {
            model.addAttribute("user", null);
        }

        Page<Store> stores;

        if (search != null && !search.isBlank() && category != null && !category.isBlank()) {
            stores = storeService.getStoresBySearchAndCategory(search, pageable, category);
        } else if (search != null && !search.isBlank()) {
            stores = storeService.getStoresBySearch(search, pageable);
        } else if (category != null && !category.isBlank()) {
            stores = storeService.getStoresByCategory(category, pageable);
        } else {
            stores = storeService.getStores(pageable);
        }

        model.addAttribute("stores", stores);

        return "main/main";
    }


    @GetMapping("restik")
    public String restik(
            @RequestParam("id") Long id,
            @RequestParam(required = false) String category,
            @RequestParam(defaultValue = "0") int page,
            Authentication auth,
            Model model) {

        model.addAttribute("category", category);
        model.addAttribute("page", page);
        model.addAttribute("id",id);
        model.addAttribute("store", storeService.getStoreById(id));

        Pageable pageable = PageRequest.of(page, 8);

        if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
            model.addAttribute("user", userService.getUserByEmail(auth.getName()));
        } else {
            model.addAttribute("user", null);
        }
        if (category != null) {
            model.addAttribute("dishes", dishService.findAllByStoreIdAndCategory(id, pageable, category));
            return "main/dishes";
        }
        model.addAttribute("dishes", dishService.findAllByStoreId(id, pageable));
        return "main/dishes";
    }

}
