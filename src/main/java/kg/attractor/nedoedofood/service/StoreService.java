package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.dto.StoreDto;
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

    public Page<StoreDto> getStores(Pageable pageable) {
        return storeRepository.findAll(pageable)
                .map(store -> new StoreDto(
                        store.getId(),
                        store.getName(),
                        store.getCategory().getName(),
                        store.getDescription(),
                        store.getLogo(),
                        store.getPhoneNumber(),
                        store.getEmail(),
                        store.getWorkTimeFrom(),
                        store.getWorkTimeTo()
                ));
    }

    public Page<StoreDto> getStoresByCategory(String category, Pageable pageable) {
        return storeRepository.findAllByCategoryName(category, pageable)
                .map(store -> new StoreDto(
                        store.getId(),
                        store.getName(),
                        store.getCategory().getName(),
                        store.getDescription(),
                        store.getLogo(),
                        store.getPhoneNumber(),
                        store.getEmail(),
                        store.getWorkTimeFrom(),
                        store.getWorkTimeTo()
                ));
    }

    public Page<StoreDto> getStoresBySearch(String search, Pageable pageable) {
            return storeRepository.findAllBySearch(search, pageable)
                    .map(store -> new StoreDto(
                            store.getId(),
                            store.getName(),
                            store.getCategory().getName(),
                            store.getDescription(),
                            store.getLogo(),
                            store.getPhoneNumber(),
                            store.getEmail(),
                            store.getWorkTimeFrom(),
                            store.getWorkTimeTo()
                    ));
    }

    public Page<StoreDto> getStoresBySearchAndCategory(String search, Pageable pageable, String category) {
        return storeRepository.findAllBySearchAndCatogory(search, pageable, category)
                .map(store -> new StoreDto(
                        store.getId(),
                        store.getName(),
                        store.getCategory().getName(),
                        store.getDescription(),
                        store.getLogo(),
                        store.getPhoneNumber(),
                        store.getEmail(),
                        store.getWorkTimeFrom(),
                        store.getWorkTimeTo()
                ));
    }

    public StoreDto getStoreById(Long id) {
        Store store = storeRepository.findById(id).orElseThrow((null));
        return new StoreDto(store.getId(),
                store.getName(),
                store.getCategory().getName(),
                store.getDescription(),
                store.getLogo(),
                store.getPhoneNumber(),
                store.getEmail(),
                store.getWorkTimeFrom(),
                store.getWorkTimeTo());
    }
}
