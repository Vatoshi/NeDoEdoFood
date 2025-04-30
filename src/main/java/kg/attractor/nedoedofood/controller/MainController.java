package kg.attractor.nedoedofood.controller;

import kg.attractor.nedoedofood.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {
    private final StoreService storeService;

    @GetMapping
    public String mainPage(Model model) {
        Pageable pageable = PageRequest.of(0, 20);
        model.addAttribute("stores", storeService.getStores(pageable));
        return "main/main";
    }

    @GetMapping("restik")
    public String restik(Model model) {

        return "main/dishes";
    }
}
