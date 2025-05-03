package kg.attractor.nedoedofood.repository;

import kg.attractor.nedoedofood.model.Dish;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DishRepository extends JpaRepository<Dish, Long> {

    public Page<Dish> findAllByStoreId(Long storeId, Pageable pageable);

    public Page<Dish> findAllByStoreIdAndCategoryName(Long storeId, Pageable pageable, String categoryName);
}
