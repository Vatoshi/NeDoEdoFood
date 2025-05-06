package kg.attractor.nedoedofood.repository;

import kg.attractor.nedoedofood.model.Order;
import kg.attractor.nedoedofood.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findAllByUser(User user);
}
