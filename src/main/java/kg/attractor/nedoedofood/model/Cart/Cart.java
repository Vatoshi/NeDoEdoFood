package kg.attractor.nedoedofood.model.Cart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@RequiredArgsConstructor
@AllArgsConstructor
@Data
public class Cart {
    private List<CartItem> carts;

    public void addProduct(int productId) {
        for (CartItem item : carts) {
            if (item.getId() == (productId)) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        carts.add(new CartItem(productId, 1));
    }

    public void removeProduct(Long productId) {
        carts.removeIf(item -> item.getId() == (productId));
    }
}
