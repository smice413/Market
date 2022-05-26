package market.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.istack.logging.Logger;

import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.MemberDTO;
import market.model.OrderPageDTO;
import market.model.OrderPageItemDTO;
import market.model.Order_productDTO;
import market.model.Order_tabDTO;
import market.model.ProductDTO;
import market.service.CartService;
import market.service.MemberServiceImpl;
import market.service.OrdereService;

@Controller
public class OrderController {
	
	@Autowired
	private OrdereService os;
	
	@Autowired
	private MemberServiceImpl ms;
	
	@Autowired
	private CartService cs;
	
	// 주문페이지
	@RequestMapping("order.do")
	public String orderPage(HttpSession session,OrderPageDTO opd ,HttpServletRequest request, Model model) throws Exception {

		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
		System.out.println("orders:"+opd.getOrders());
		
		// 주문 상품 정보
		List<OrderPageItemDTO> orders = opd.getOrders();
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO productInfo = os.getProductInfo(ord.getCart_no());			

			productInfo.setCart_qty(ord.getCart_qty());
			
			productInfo.totalPrice();
			System.out.println("productInfo:"+productInfo);
			
		    result.add(productInfo);			
		}	
		
		// 주문자 정보 조회
		MemberDTO memberList = ms.select(m_email);
		System.out.println("memberList:"+memberList);
		
		// 기본 배송지 조회
		DeliveryDTO deliveryInfo = os.getDeliveryInfo(m_email);
		System.out.println("deliveryInfo:"+deliveryInfo);
		
		model.addAttribute("productInfo",result);
		model.addAttribute("memberList", memberList);
		model.addAttribute("deliveryInfo", deliveryInfo);
		
		
		return "order/order";
	}
	
	// 배송지 등록 폼
	@RequestMapping("deliveryInsertForm.do")
	public String deliveryInsertForm() {
		return "order/deliveryInsertForm";	
	}
	
	
	// 배송지 등록
	@RequestMapping("deliveryInsert.do")
	public String deliveryInsert(HttpSession session,DeliveryDTO delivery, Model model, HttpServletRequest request) throws Exception {
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);
		System.out.println("delivery:"+delivery);
		
		delivery.setM_email(m_email);
		
		int result = os.deliveryInsert(delivery);
		System.out.println("result:"+result);
		
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
	@RequestMapping("updateDefaultAddr.do")
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
	
	// 배송지 수정 폼
	@RequestMapping("deliveryUpdateForm.do")
	public String deliveryUpdateForm(int d_no, Model model) {
		System.out.println("d_no:"+d_no);
		
		DeliveryDTO delivery = os.getDelivery(d_no);
		
		model.addAttribute("dl", delivery);
		
		return "order/deliveryUpdateForm";
	}
	
	// 배송지 수정
	@RequestMapping("deliveryUpdate.do")
	public String  deliveryUpdate(DeliveryDTO delivery) throws Exception{
		System.out.println("delivery:"+delivery);
		
		int result = os.addressUpdate(delivery);
		System.out.println("result:"+result);
		
		return "order/deliveryUpdateResult";
	}
	
	// 배송지 삭제
	@RequestMapping("deleteAddr.do")
	public String deleteAddr( int d_no, Model model) throws Exception{
		System.out.println("d_no:"+d_no);
		
		int result = os.deleteAddr(d_no);
		System.out.println("result:"+result);
		
		model.addAttribute("result", result);
		
		return "order/deliveryDeleteResult.jsp";
	}

	// 주문 등록
	@RequestMapping("orderInsert.do")
	public String orderInsert(Order_tabDTO otd, HttpSession session) throws Exception{
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("m_email:"+m_email);

		otd.setM_email(m_email);
		System.out.println("otd:"+otd);
		
		
		// 주문 정보
		List<Order_productDTO> opds = new ArrayList<>();
		for(Order_productDTO opd : otd.getOrders()) {

			Order_productDTO orderProduct = os.getOrderInfo(opd.getP_no());

			orderProduct.setOp_qty(opd.getCart_qty());
			orderProduct.setOp_price(orderProduct.getP_sell_price());
			orderProduct.setOp_refund(orderProduct.getOp_price()*orderProduct.getOp_qty());
			orderProduct.setOp_calc(orderProduct.getOp_refund());
			orderProduct.setD_no(otd.getD_no());
			orderProduct.setM_email(otd.getM_email());
			orderProduct.setOp_type(opd.getOp_type());
			opds.add(orderProduct);
			
			System.out.println("op_price:"+orderProduct.getOp_price());
			System.out.println("Op_qty:"+opd.getCart_qty());
			System.out.println("op_refund:"+orderProduct.getOp_refund());
			System.out.println("op_calc:"+orderProduct.getOp_calc());
			System.out.println("d_no:"+orderProduct.getD_no());
			System.out.println("M_email:"+orderProduct.getM_email());
			System.out.println("op_refund:"+orderProduct.getOp_refund());
			System.out.println("Op_type:"+orderProduct.getOp_type());
		}
		
		otd.setOrders(opds);
		otd.getOrderPriceInfo();
		System.out.println("d_msg:"+otd.getD_msg());
		System.out.println("o_pay_price:"+otd.getO_pay_price());
		System.out.println("o_pay_type:"+otd.getO_pay_type());
		System.out.println("orders:"+otd.getOrders());
				
		// 주문,주문상품 테이블에 저장
		int result1 = os.orderInsert(otd);  // order_tab 등록
		System.out.println("order_tab입력 :"+result1);
		
	//	List<Integer> orderList = os.getOrder(m_email);
		
//		if(result1 == 1) {
//			
//			List<Order_productDTO> pd = new ArrayList<>();
//			 for( Order_productDTO opd : otd.getOrders()) {
//				
//				 Order_productDTO product = new Order_productDTO();
//				 for(int i=0; i<orderList.size(); i++) {
//					product.setO_no(orderList.get(i));
//				 }
//				 product.setP_no(opd.getP_no());
//				 product.setOp_type(opd.getOp_type());
//				 product.setOp_qty(opd.getOp_qty());
//				 product.setOp_price(opd.getOp_price());
//				 product.setOp_refund(opd.getOp_refund());
//				 product.setOp_calc(opd.getOp_calc());
//				 product.setD_no(opd.getD_no());
//				 product.setS_no(opd.getS_no());
//				 product.setM_email(opd.getM_email());
//				 
//				 System.out.println("o_no:"+opd.getO_no());
//				 System.out.println("product:"+product);
//				 
//				 int result2 = os.orderProductInsert(product); //order_product 등록
//				 System.out.println("order_product입력"+result2); 
//			 }
//		 }	 
		
				
		// 재고 변동 적용
		for(Order_productDTO opd : otd.getOrders()) {
			// 변동 재고 값 구하기
			ProductDTO product = os.productInfo(opd.getP_no());
			System.out.println("변경 전 재고:"+product);
			
			product.setP_stock(product.getP_stock()-opd.getOp_qty());
			System.out.println("변경 후 재고:"+product.getP_stock());
			
			int result = os.updateStock(product);
			System.out.println("재고 변동 :"+result);
		}
				
		// 장바구니 제거
		for(Order_productDTO opd : otd.getOrders()) {
			CartDTO cart = new CartDTO();
			cart.setM_email(otd.getM_email());
			cart.setP_no(opd.getP_no());
					
			int result = cs.deleteOrderCart(cart);
			System.out.println("장바구니 제거"+result);
		}

	 return "redirect:main.do";
	}

}
