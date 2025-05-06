package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.dto.OrderDto;
import kg.attractor.nedoedofood.model.Order;
import kg.attractor.nedoedofood.model.User;
import kg.attractor.nedoedofood.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;

    public void save(Order order) {
        orderRepository.saveAndFlush(order);
    }

    public List<Order> getUserOrders(User user) {
        return orderRepository.findAllByUser(user);
    }
}
