package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.model.Store;
import kg.attractor.nedoedofood.repository.StoreRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class StoreService {
    private final StoreRepository storeRepository;

    public Page<Store> getStores(Pageable pageable) {
        return storeRepository.findAll(pageable);
    }
}
