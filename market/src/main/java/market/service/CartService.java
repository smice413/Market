package market.service;

import java.util.List;
import java.util.Map;

import market.model.CartDTO;

public interface CartService {
	boolean findCartProduct(CartDTO cart);
	void insert(CartDTO cart);
	List<CartDTO> list(String m_email);
    int update(CartDTO cart);
    int delete(int cart_no);
}
