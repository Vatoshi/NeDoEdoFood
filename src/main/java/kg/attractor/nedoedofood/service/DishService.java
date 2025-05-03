package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.model.Dish;
import kg.attractor.nedoedofood.repository.DishRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DishService {
    private final DishRepository dishRepository;

    public Page<Dish> findAllByStoreId(Long storeId, Pageable pageable) {
        return dishRepository.findAllByStoreId(storeId, pageable);
    }

    public Page<Dish> findAllByStoreIdAndCategory(Long storeId, Pageable pageable, String category) {
        return dishRepository.findAllByStoreIdAndCategoryName(storeId,pageable,category);
    }
}
