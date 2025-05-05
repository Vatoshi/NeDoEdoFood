package kg.attractor.nedoedofood.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kg.attractor.nedoedofood.dto.CartDto;
import kg.attractor.nedoedofood.dto.UserFormDto;
import jakarta.servlet.http.Cookie;

import kg.attractor.nedoedofood.model.Cart.CartItem;

import kg.attractor.nedoedofood.model.Dish;
import kg.attractor.nedoedofood.model.User;
import kg.attractor.nedoedofood.repository.AuthorityRepository;
import kg.attractor.nedoedofood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.*;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final AuthorityRepository authorityRepository;
    private final DishService dishService;

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    public boolean existsByEmail(String email) {
        return userRepository.findByEmail(email).isPresent();
    }

    public void createUser(UserFormDto userFormDto) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        User user = User.builder()
                .authority(authorityRepository.findById(1L).orElse(null))
                .name(userFormDto.getName())
                .email(userFormDto.getEmail())
                .password(encoder.encode(userFormDto.getPassword()))
                .phoneNumber(userFormDto.getPhoneNumber())
                .enabled(true)
                .build();

        userRepository.save(user);
    }

    public List<CartDto> getDishesForCarts(Cookie[] cookies) throws UnsupportedEncodingException, JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        List<CartDto> carts = new ArrayList<>();

        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("cart".equals(c.getName())) {
                    String value = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
                    List<CartItem> items = mapper.readValue(value, new TypeReference<List<CartItem>>() {});

                    Map<Long, CartItem> uniqueItems = new HashMap<>();
                    for (CartItem item : items) {
                        uniqueItems.putIfAbsent(item.getId(), item);
                    }

                    for (CartItem item : uniqueItems.values()) {
                        Dish dish = dishService.findById(item.getId());
                        CartDto cartDto = CartDto.builder()
                                .id(item.getId())
                                .photo(dish.getPhoto())
                                .name(dish.getName())
                                .price(dish.getPrice())
                                .description(dish.getDescription())
                                .quantity(item.getQuantity())
                                .build();
                        carts.add(cartDto);
                    }

                    break;
                }
            }
        }

        return carts;
    }



    public List<CartItem> minusQuantity(List<CartItem> carts, Long id) {
        for (CartItem cart : carts) {
            if (cart.getId().equals(id)) {
                cart.setQuantity(cart.getQuantity() - 1);
            }
        }
        return carts;
    }

    public List<CartItem> plusQuantity(List<CartItem> carts, Long id) {
        for (CartItem cart : carts) {
            if (cart.getId().equals(id)) {
                cart.setQuantity(cart.getQuantity() + 1);
            }
        }
        return carts;
    }

    public List<CartItem> deleteDish(List<CartItem> carts, Long id) {
        carts.removeIf(item -> item.getId().equals(id));
        return carts;
    }


}
