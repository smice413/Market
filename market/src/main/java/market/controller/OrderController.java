package market.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.MemberDTO;
import market.model.OrderPageDTO;
import market.service.MemberServiceImpl;
import market.service.OrdereService;

@Controller
public class OrderController {
	
	@Autowired
	private OrdereService os;
	
	@Autowired
	private MemberServiceImpl ms;
	
	@RequestMapping("order.do")
	public String orderPage(HttpSession session, CartDTO cart, Model model) throws Exception {
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
		System.out.println("p_no:"+cart.getP_no());
		System.out.println("cart_no:"+cart.getCart_qty());
		
		MemberDTO memberList = ms.select(m_email);
		System.out.println("memberList:"+memberList);
		
		DeliveryDTO deliveryInfo = os.getDeliveryInfo(m_email);
		System.out.println("deliveryInfo:"+deliveryInfo);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("deliveryInfo", deliveryInfo);
		
		
		return "cart/order";
	}
	
	
}
