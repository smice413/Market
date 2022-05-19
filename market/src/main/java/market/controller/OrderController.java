package market.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.MemberDTO;
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
		
		String address = deliveryInfo.getD_address();
		String addr[] = address.split(" ");
		
		deliveryInfo.setAddr1(addr[0]);
		deliveryInfo.setAddr2(addr[1]);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("deliveryInfo", deliveryInfo);
		
		
		return "order/order";
	}
	
	@RequestMapping("deliveryInsert.do")
	public String deliveryInsert(HttpSession session, DeliveryDTO delivery, Model model, HttpServletRequest request) throws Exception {
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
	
		String d_address = delivery.getAddr1()+" "+delivery.getAddr2();
		System.out.println("d_address:"+d_address);
		
		delivery.setM_email(m_email);
		delivery.setD_address(d_address);
		
		// 배송지 등록이 처음인지 여부 확인
		int addressCount = os.getAddressCount(m_email);
		int result = 0;
		
		// 첫 등록하는 주소를 기본 배송지로 설정
		if(addressCount == 0) {
			result = os.deliveryInsertY(delivery);
			System.out.println("result:"+result);
		}else if(addressCount>=1) {
			result = os.deliveryInsertN(delivery);
			System.out.println("result:"+result);
		}
		
		model.addAttribute("result", result);
		
		return "order/deliveryInsertResult";
	}
	
}
