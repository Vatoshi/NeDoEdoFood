package kg.attractor.nedoedofood.controller;

import kg.attractor.nedoedofood.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("auth")
public class AuthController {
    private final UserService userService;

    @GetMapping("login")
    public String login(Model model) {
        return "login/login";
    }
}
