package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.dto.DishDto;
import kg.attractor.nedoedofood.model.Dish;
import kg.attractor.nedoedofood.repository.DishRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DishService {
    private final DishRepository dishRepository;

    public Page<DishDto> findAllByStoreId(Long storeId, Pageable pageable) {
        return dishRepository.findAllByStoreId(storeId, pageable)
                .map(dish -> new DishDto(
                        dish.getId(),
                        dish.getName(),
                        dish.getDescription(),
                        dish.getPhoto(),
                        dish.getCategory().getName(),
                        dish.getInStock(),
                        dish.getPrice()
                ));
    }

    public Page<DishDto> findAllByStoreIdAndCategory(Long storeId, Pageable pageable, String category) {
        return dishRepository
                .findAllByStoreIdAndCategoryName(storeId, pageable, category)
                .map(dish -> new DishDto(
                        dish.getId(),
                        dish.getName(),
                        dish.getDescription(),
                        dish.getPhoto(),
                        dish.getCategory().getName(),
                        dish.getInStock(),
                        dish.getPrice()
                ));
    }


    public Dish findById(Long id) {
        return dishRepository.findById(id).orElse(null);
    }
}
