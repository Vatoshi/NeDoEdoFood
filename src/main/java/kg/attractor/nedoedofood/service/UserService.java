package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.dto.UserFormDto;
import kg.attractor.nedoedofood.model.Authority;
import kg.attractor.nedoedofood.model.User;
import kg.attractor.nedoedofood.repository.AuthorityRepository;
import kg.attractor.nedoedofood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final AuthorityRepository authorityRepository;

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
}
