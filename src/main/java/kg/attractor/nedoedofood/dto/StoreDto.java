package kg.attractor.nedoedofood.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StoreDto {
    private Long id;
    private String name;
    private String category;
    private String description;
    private String image;
    private Long phoneNumber;
    private String email;
    private Timestamp workTimeFrom;
    private Timestamp workTimeTo;
}
