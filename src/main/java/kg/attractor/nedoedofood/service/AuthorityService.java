package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.model.Authority;
import kg.attractor.nedoedofood.repository.AuthorityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthorityService {
    private final AuthorityRepository authorityRepository;

    public Authority getAuthority(Long id) {
        return authorityRepository.findById(id).orElse(null);
    }
}
