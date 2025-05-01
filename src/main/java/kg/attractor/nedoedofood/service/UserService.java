package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.model.User;
import kg.attractor.nedoedofood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }
}
