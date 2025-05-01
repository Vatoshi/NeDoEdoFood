package kg.attractor.nedoedofood.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserFormDto {
    @NotEmpty
    private String name;
    @NotEmpty
    @Email
    private String email;
    @NotEmpty
    @Pattern(regexp = "^.{3,}$", message = "минимум 3 символа")
    private String password;
    @NotEmpty
    @Pattern(regexp = "^996\\s\\d{3}\\s\\d{3}\\s\\d{3}$", message = "формат 996 000 000 000")
    private String phoneNumber;
}
