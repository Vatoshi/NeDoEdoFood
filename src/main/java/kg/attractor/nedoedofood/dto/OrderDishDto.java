package kg.attractor.nedoedofood.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderDishDto {
    private String name;
    private int price;
    private int quantity;
}
