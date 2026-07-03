package com.motorcycle.service;

import com.motorcycle.model.CartItem;
import com.motorcycle.model.Product;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

public class CartService {
    private static final String CART_KEY = "cartItems";
    private final CatalogService catalogService = new CatalogService();

    @SuppressWarnings("unchecked")
    public List<CartItem> getCart(HttpSession session) {
        Object value = session.getAttribute(CART_KEY);
        if (value instanceof List) {
            return (List<CartItem>) value;
        }
        List<CartItem> cart = new ArrayList<CartItem>();
        session.setAttribute(CART_KEY, cart);
        return cart;
    }

    public void addItem(HttpSession session, int productId, String color, int quantity) {
        Product product = catalogService.findProduct(productId)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm."));
        List<CartItem> cart = getCart(session);
        for (CartItem item : cart) {
            if (item.getProduct().getId() == productId && safe(item.getColor()).equalsIgnoreCase(safe(color))) {
                item.setQuantity(item.getQuantity() + Math.max(1, quantity));
                return;
            }
        }
        cart.add(new CartItem(product, color == null || color.isEmpty() ? "Ducati Red" : color, Math.max(1, quantity)));
    }

    public void clear(HttpSession session) {
        getCart(session).clear();
    }

    public BigDecimal subtotal(HttpSession session) {
        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : getCart(session)) {
            total = total.add(item.getLineTotal());
        }
        return total;
    }

    private String safe(String value) {
        return value == null ? "" : value;
    }
}
