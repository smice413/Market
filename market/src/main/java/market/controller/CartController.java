package market.controller;


import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import market.model.CartDTO;
import market.service.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService cs;
	
	@RequestMapping("productViewTest.do")
	public String productDetail(HttpSession session) {
		
		return "cart/productViewTest";
	}
	
	// 장바구니에 상품 등록
	@RequestMapping("cartInsert.do")
	public String cartInsert(CartDTO cart, HttpSession session, Model model) {
		System.out.println("p_no:"+cart.getP_no());
		System.out.println("cart_qty:"+cart.getCart_qty());
		
        String m_email = (String)session.getAttribute("m_email");
        System.out.println("m_email:"+m_email);
        
        cart.setM_email(m_email);
		
		// 해당 상품이 장바구니에 존재하는지 여부 판별
		boolean isAlreadyExisted = cs.findCartProduct(cart);
		System.out.println("isAlreadyExisted:"+isAlreadyExisted);
		
		if(isAlreadyExisted) {
			System.out.println("동일한 상품 있음:"+isAlreadyExisted);
			System.out.println("existed");
			
			String result = "existed";
			model.addAttribute("result", result);
			
			return "cart/insertResult";
		}else {
			System.out.println("동일한 상품 없음 :"+isAlreadyExisted);
			cs.insert(cart);
			System.out.println("success");
			
			String result = "success";
			model.addAttribute("result", result);
			
			return "cart/insertResult";
		}
		
		
	}
	
	// 장바구니 목록
	@RequestMapping("cartList.do")
	public String cartList(HttpSession session, Model model) {
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);

		List<CartDTO> cartList = cs.list(m_email);
		System.out.println("cartList:"+cartList);
		
		model.addAttribute("cartList", cartList);
		
		return "cart/cartList";
	}
	
	// 상품 수량 변경
	@RequestMapping("cartQtyUpdate.do")
	public String cartQtyUpdate(CartDTO cart, Model model) {
		int result = cs.update(cart);
		String m_email = cart.getM_email();
		
		System.out.println("result:"+result);
		System.out.println("m_email:"+m_email);
		
		model.addAttribute("result", result);
		model.addAttribute("m_email", m_email);
		
		return "cart/cartQtyUpdate";
	}
	
	// 장바구니 상품 삭제
	@RequestMapping("cartDelete.do")
	public String cartDelete(int cart_no, HttpSession session) {
		System.out.println("cartDelete");
		
		String m_email = (String)session.getAttribute("m_email");
		int result = cs.delete(cart_no);
		System.out.println("result:"+result);
		
		return "redirect:cartList.do?m_email=m_email";
	}
	
}
