package kg.attractor.nedoedofood.repository;

import kg.attractor.nedoedofood.model.Order;
import kg.attractor.nedoedofood.model.OrderedDish;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderedDishRepository extends JpaRepository<OrderedDish, Long> {

    List<OrderedDish> findAllByOrder(Order order);
}

