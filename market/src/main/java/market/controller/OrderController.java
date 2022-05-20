package market.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.istack.logging.Logger;

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
	
	// 주문페이지
	@RequestMapping("order.do")
	public String orderPage(HttpSession session, CartDTO cart, Model model) throws Exception {
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
		System.out.println("p_no:"+cart.getP_no());
		System.out.println("cart_no:"+cart.getCart_qty());
		
		// 주문자 정보 조회
		MemberDTO memberList = ms.select(m_email);
		System.out.println("memberList:"+memberList);
		
		// 기본 배송지 조회
		DeliveryDTO deliveryInfo = os.getDeliveryInfo(m_email);
		System.out.println("deliveryInfo:"+deliveryInfo);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("deliveryInfo", deliveryInfo);
		
		
		return "order/order";
	}
	
	// 배송지 등록
	@RequestMapping("deliveryInsert.do")
	public String deliveryInsert(HttpSession session, DeliveryDTO delivery, Model model, HttpServletRequest request) throws Exception {
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
		System.out.println("p_post:"+delivery.getD_post());
		delivery.setM_email(m_email);
		
		// 배송지 등록이 처음인지 여부 확인
		int addressCount = os.getAddressCount(m_email);
		System.out.println("addressCount:"+addressCount);
		
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
	
	// 배송지 목록 팝업창
	@GetMapping("deliveryListPop.do")
	public String deliveryList(HttpSession session, Model model) throws Exception{
		System.out.println("deliveryListPop");
		
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
		
		List<DeliveryDTO> deliveryList = os.getDeliveryList(m_email);
		System.out.println("deliveryList:"+deliveryList);
		
		if(!deliveryList.isEmpty()) {    // 저장된 주소가 있는 경우
			model.addAttribute("deliveryList", deliveryList); 
		}else {                          // 저장된 주소가 없는 경우
			model.addAttribute("listCheck", "empty");
		}
		return "order/deliveryListPop";
	}
	
	// 기본배송지 변경
	@RequestMapping("UpdateDefaultAddr.do")
	public String UpdateDefaultAddr(int d_no, HttpSession session, Model model) throws Exception{
		System.out.println("d_no:"+d_no);
		
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
		
		// 기존에 있던 기본배송지의 d_default값을 N으로 변경
		int result1 = os.UpdateDefaultN(m_email);
		System.out.println("result1:"+result1);
		
		if(result1 == 1) {
			// 선택된 배송지의 d_default값을 Y로 변경
			int result2 = os.UpdateDefaultY(d_no);
			System.out.println("result2:"+result2);
		}
		
		return "order/updateDefaultResult";
	}
	
	// 기본배송지 수정
	@RequestMapping("addressUpdate.do")
	public String  deliveryUpdate(DeliveryDTO delivery, HttpSession session) throws Exception{
		String m_email = (String)session.getAttribute("m_email");
		
		int result = os.addressUpdate(delivery);
		System.out.println("result:"+result);
		
		return "redirect:order.do";
	}
	
}
