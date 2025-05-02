package kg.attractor.nedoedofood.repository;

import kg.attractor.nedoedofood.model.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface StoreRepository extends JpaRepository<Store, Long> {

    Page<Store> findAllByCategoryName(String category, Pageable pageable);

    @Query("select s from Store s where lower(s.name) like lower(concat('%', :search, '%'))")
    Page<Store> findAllBySearch(String search, Pageable pageable);

    @Query("""
    SELECT s FROM Store s
    WHERE LOWER(s.name) LIKE LOWER(CONCAT('%', :search, '%'))
      AND s.category.name = :category
    ORDER BY s.category.name
""")
    Page<Store> findAllBySearchAndCatogory(String search, Pageable pageable, String category);

}
