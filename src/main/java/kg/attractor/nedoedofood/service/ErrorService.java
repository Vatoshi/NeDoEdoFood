package kg.attractor.nedoedofood.service;

import kg.attractor.nedoedofood.exeption.ErrorResponseBody;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ErrorService {
    private String title;
    private Map<String, List<String>> response;

    public ErrorResponseBody makeResponse (Exception e, String title, HttpStatus status) {
        String msg = title;
        return ErrorResponseBody.builder()
                .title(msg)
                .status(status.value())
                .response(Map.of("errors", List.of(e.getMessage())))
                .build();
    }

    public ErrorResponseBody makeResponse(BindingResult bindingResult) {
        Map<String, List<String>> reasons = new HashMap<>();

        bindingResult.getFieldErrors().stream()
                .filter(err -> err.getDefaultMessage() != null)
                .forEach(err -> {
                    List<String> errors = reasons.computeIfAbsent(err.getField(), k -> new ArrayList<>());
                    errors.add(err.getDefaultMessage());
                });

        return ErrorResponseBody.builder()
                .title("Validation Error")
                .response(reasons)
                .status(HttpStatus.BAD_REQUEST.value())
                .build();
    }

}

