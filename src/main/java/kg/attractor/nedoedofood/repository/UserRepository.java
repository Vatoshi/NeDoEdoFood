package kg.attractor.nedoedofood.repository;

import kg.attractor.nedoedofood.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
