package kg.attractor.nedoedofood.controller;

import jakarta.servlet.http.HttpServletRequest;
import kg.attractor.nedoedofood.service.UserService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("auth")
public class AuthController {
    private final UserService userService;

    @GetMapping("403")
    public String accessDenied(Model model, HttpServletRequest request) {
        model.addAttribute("status",403);
        model.addAttribute("reason", HttpStatus.FORBIDDEN.getReasonPhrase());
        model.addAttribute("details", request);
        return "error/error";
    }

    @GetMapping("login")
    public String login(@RequestParam(required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "Неверная почта или пароль");
        }
        return "login/login";
    }
}
