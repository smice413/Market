package market.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import market.dao.CartDAO;
import market.model.CartDTO;
import market.model.ProductDTO;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cd;

	@Override
	public boolean findCartProduct(CartDTO cart) {
		return cd.findCartProduct(cart);
	}
	
	@Override
	public void insert(CartDTO cart) {
		cd.insert(cart);
	}
	
	@Override
	public List<CartDTO> list(String m_email) {
		System.out.println("Service m_email:"+m_email);
		
		return cd.list(m_email);
	}

	@Override
	public int update(CartDTO cart) {
		return cd.update(cart);
	}

	@Override
	public int delete(int cart_no) {
		return cd.delete(cart_no);
	}


	

	
	
}
