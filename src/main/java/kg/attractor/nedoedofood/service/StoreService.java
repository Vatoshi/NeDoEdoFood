package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.model.Store;
import kg.attractor.nedoedofood.repository.StoreRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

@Service
@RequiredArgsConstructor
public class StoreService {
    private final StoreRepository storeRepository;

    public Page<Store> getStores(Pageable pageable) {
        return storeRepository.findAll(pageable);
    }

    public Page<Store> getStoresByCategory(String category, Pageable pageable) {
        return storeRepository.findAllByCategoryName(category, pageable);
    }

    public Page<Store> getStoresBySearch(String search, Pageable pageable) {
            return storeRepository.findAllBySearch(search, pageable);
    }

    public Page<Store> getStoresBySearchAndCategory(String search, Pageable pageable, String category) {
        return storeRepository.findAllBySearchAndCatogory(search, pageable, category);
    }

    public Store getStoreById(Long id) {
        return storeRepository.findById(id).orElseThrow((null));
    }
}
