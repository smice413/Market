package market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import market.model.Order_manageDTO;
import market.model.Order_productDTO;
import market.service.ShopManageService;

@Controller
public class ShopManageController {
	
	@Autowired
	private ShopManageService sms;

	// 판매자 주문 관리
	@RequestMapping("order_tabList.do")
	public String order_tabList(Model model) {

		/*
		 * int s_no = 3; // 판매자 로그인 미구현으로 임시로 판매자 샵넘버 세션 공유 String s_email =
		 * "minjun@gmail.com"; // 판매자 로그인 미구현으로 임시로 판매자 이메일 세션 공유
		 * 
		 * HttpSession session = request.getSession(); session.setAttribute("s_no",
		 * s_no); session.setAttribute("s_email", s_email);
		 */

		List<Order_manageDTO> olist = sms.olist();
		model.addAttribute("olist", olist);
		
		System.out.println("샵매니저 컨트롤러");

		return "shop/order_tabList";
	}
	
	//환불관리
	@RequestMapping("refundList.do")
	public String refundList(Model model) {
		
		List<Order_productDTO> oplist = sms.oplist();
		model.addAttribute("oplist", oplist);
		
		return "shop/refundList";
	}
	

}
