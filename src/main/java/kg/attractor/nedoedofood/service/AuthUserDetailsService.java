package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.model.Authority;
import kg.attractor.nedoedofood.model.User;
import kg.attractor.nedoedofood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Component
@RequiredArgsConstructor
public class AuthUserDetailsService implements UserDetailsService {
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = userRepository.findByEmail(username).orElseThrow(() -> new UsernameNotFoundException(username));
        Authority authority = user.getAuthority();
        Collection<GrantedAuthority> authorities = getAuthorities(authority);

        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),
                user.getPassword(),
                user.getEnabled(),
                true,
                true,
                true,
                authorities
        );
    }

    private Collection<GrantedAuthority> getAuthorities(Authority authority) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(authority.getName()));
        return authorities;
    }
}

