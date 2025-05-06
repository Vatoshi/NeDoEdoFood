package kg.attractor.nedoedofood.exeption;

import kg.attractor.nedoedofood.service.ErrorService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalControllerAdvice {
    private final ErrorService errorService;

    @ExceptionHandler(IllegalArgumentException.class)
    private ResponseEntity<ErrorResponseBody> illegalArgumentHandler(IllegalArgumentException e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorService.makeResponse(e, "invalid request", HttpStatus.BAD_REQUEST));
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    private ResponseEntity<ErrorResponseBody> validHandler(MethodArgumentNotValidException e) {
        return new ResponseEntity<>(errorService.makeResponse(e.getBindingResult()), HttpStatus.BAD_REQUEST);
    }
}
