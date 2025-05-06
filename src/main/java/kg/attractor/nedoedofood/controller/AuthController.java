package kg.attractor.nedoedofood.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import kg.attractor.nedoedofood.dto.UserFormDto;
import kg.attractor.nedoedofood.service.UserService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("userFormDto", new UserFormDto());
        return "login/register";
    }

    @PostMapping("register")
    public String registerPost(@Valid UserFormDto userFormDto, BindingResult bindingResult ,Model model) {
        model.addAttribute("userFormDto", userFormDto);
        if (bindingResult.hasErrors()) {
            return "login/register";
        }
        if (userService.existsByEmail(userFormDto.getEmail())) {
            bindingResult.rejectValue("email","error.email", "Пользователь с такой почтой уже существует");
            return "login/register";
        }
        userService.createUser(userFormDto);
        return "redirect:/auth/login";
    }
}
