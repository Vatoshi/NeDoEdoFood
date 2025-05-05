package kg.attractor.nedoedofood.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartDto {
    private Long id;
    private String photo;
    private int quantity;
    private String name;
    private String description;
    private int price;
}
