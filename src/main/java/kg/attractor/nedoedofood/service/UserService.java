package kg.attractor.nedoedofood.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kg.attractor.nedoedofood.dto.CartDto;
import kg.attractor.nedoedofood.dto.OrderDishDto;
import kg.attractor.nedoedofood.dto.OrderDto;
import kg.attractor.nedoedofood.dto.UserFormDto;
import jakarta.servlet.http.Cookie;

import kg.attractor.nedoedofood.model.Cart.CartItem;

import kg.attractor.nedoedofood.model.Dish;
import kg.attractor.nedoedofood.model.Order;
import kg.attractor.nedoedofood.model.OrderedDish;
import kg.attractor.nedoedofood.model.User;
import kg.attractor.nedoedofood.repository.AuthorityRepository;
import kg.attractor.nedoedofood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.aspectj.weaver.ast.Or;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final AuthorityRepository authorityRepository;
    private final DishService dishService;
    private final OrderService orderService;
    private final OrderDishService orderDishService;

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
                    String value = URLDecoder.decode(c.getValue(), "UTF-8");
                    List<CartItem> items = mapper.readValue(value, new TypeReference<List<CartItem>>() {});

                    Set<Long> seenIds = new HashSet<>();
                    List<CartItem> uniqueItems = new ArrayList<>();
                    for (CartItem item : items) {
                        if (seenIds.add(item.getId())) {
                            uniqueItems.add(item);
                        }
                    }

                    for (CartItem item : uniqueItems) {
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

    @Transactional
    public void createOrder(List<CartItem> items, String email) {
        User user = getUserByEmail(email);
        int sum = 0;
        for (CartItem item : items) {
            Dish dish = dishService.findById(item.getId());
            sum += dish.getPrice() * item.getQuantity();
        }
        Order order = Order.builder()
                .createdDate(LocalDateTime.now())
                .total(sum)
                .user(user)
                .build();
        orderService.save(order);
        for (CartItem item : items) {
            Dish dish = dishService.findById(item.getId());
            OrderedDish or = OrderedDish.builder()
                    .order(order)
                    .dish(dish)
                    .quantity(item.getQuantity())
                    .build();
            orderDishService.save(or);
        }
    }

    public List<OrderDto> getUserOrders(String email) {
        User user = getUserByEmail(email);
        List<Order> orders = orderService.getUserOrders(user);
        List<OrderDto> orderDtos = new ArrayList<>();
        for (Order order : orders) {
            List<OrderedDish> orderedDishes = orderDishService.findOrderedDishesByOrder(order);
            List<OrderDishDto> orderDishDtos = orderedDishes.stream()
                    .map(orderedDish -> new OrderDishDto(
                            orderedDish.getDish().getName(),
                            orderedDish.getDish().getPrice(),
                            orderedDish.getQuantity()
                    ))
                    .collect(Collectors.toList());

            OrderDto orderDto = OrderDto.builder()
                    .orderDate(LocalDate.from(order.getCreatedDate()))
                    .price(order.getTotal())
                    .dishes(orderDishDtos)
                    .build();
            orderDtos.add(orderDto);
        }
        return orderDtos;
    }
}
