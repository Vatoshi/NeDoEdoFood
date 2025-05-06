package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.model.Order;
import kg.attractor.nedoedofood.model.OrderedDish;
import kg.attractor.nedoedofood.repository.OrderedDishRepository;
import lombok.RequiredArgsConstructor;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderDishService {
    private final OrderedDishRepository orderedDishRepository;

    public void save(OrderedDish orderedDish) {
        orderedDishRepository.save(orderedDish);
    }

    public List<OrderedDish> findOrderedDishesByOrder(Order order) {
        return orderedDishRepository.findAllByOrder(order);
    }
}
