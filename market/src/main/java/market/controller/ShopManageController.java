package market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String order_tabList(HttpSession session, HttpServletRequest request ,
			Model model) {

		session = request.getSession();
		
		int s_no = (int)session.getAttribute("s_no");
		
		List<Order_manageDTO> olist = sms.olist(s_no);
		model.addAttribute("olist", olist);
		
		return "shop/order_tabList";
	}
	
	@RequestMapping("shopOrderDetail.do")
	public String orderDetail(int o_no, Model model) {
		
		System.out.println("넘겨받은주문번호: "+o_no);
		
		List<Order_manageDTO> odlist = sms.odlist(o_no);
		model.addAttribute("odlist", odlist);
		
		return "shop/shopOrderDetail";
	}
	
	//환불관리
	@RequestMapping("refundList.do")
	public String refundList(Model model) {
		
		List<Order_productDTO> oplist = sms.oplist();
		model.addAttribute("oplist", oplist);
		
		return "shop/refundList";
	}
	
	//운송장 입력버튼 눌렀을때
	@RequestMapping("deliInsert.do")
	public String delivery(Model model, String dno, String opno) {
		
		System.out.println("상품번호 : "+opno);
		System.out.println("운송장번호 : "+dno);
		
		Order_manageDTO omdto= new Order_manageDTO();
		
		omdto.setOp_deli_no(dno);
		omdto.setOp_status("7");
		
		//int result = sms.deliNoInsert(omdto);
		int result=0;
		if(result==1) {
			System.out.println("운송장번호 입력성공!");
		}
		
		return "";
	}
	

}
