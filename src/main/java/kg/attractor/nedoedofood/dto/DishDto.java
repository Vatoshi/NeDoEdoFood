package kg.attractor.nedoedofood.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DishDto {
    private Long id;
    private String name;
    private String description;
    private String image;
    private String category;
    private Boolean inStock;
    private Integer price;
}
