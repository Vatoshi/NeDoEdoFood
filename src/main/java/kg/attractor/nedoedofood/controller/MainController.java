package kg.attractor.nedoedofood.controller;

import kg.attractor.nedoedofood.service.StoreService;
import kg.attractor.nedoedofood.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {
    private final StoreService storeService;
    private final UserService userService;

    @GetMapping
    public String mainPage(Model model, Authentication auth) {
        if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
            model.addAttribute("user", userService.getUserByEmail(auth.getName()));
        } else {
            model.addAttribute("user", null);
        }
        Pageable pageable = PageRequest.of(0, 20);
        model.addAttribute("stores", storeService.getStores(pageable));
        return "main/main";
    }

    @GetMapping("restik")
    public String restik(Model model) {

        return "main/dishes";
    }
}
