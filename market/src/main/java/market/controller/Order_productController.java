package market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import market.model.Order_productDTO;
import market.service.Order_productServiceImpl;


@Controller
public class Order_productController {

	@Autowired
	private Order_productServiceImpl ops;

	// 주문 목록 불러오기
	@RequestMapping("orderList.do")
	public String orderList(Model model) throws Exception {
		
		List<Order_productDTO> orderList = ops.orderList();
		model.addAttribute("orderList", orderList);
		
		
		return "my_page/orderList";
	}
	
	// 주문 상세 내용 불러오기
	@RequestMapping("orderDetail.do")
	public String orderDetail(Model model, @RequestParam("op_no") int op_no, 
							  @RequestParam("o_no") int o_no, Order_productDTO detail) throws Exception{
		
		detail = ops.orderDetail(op_no);
		List<Order_productDTO> detailList = ops.detailList(o_no);
		System.out.println("detailList: "+ detailList);
		
		model.addAttribute("detail", detail);
		model.addAttribute("detailList", detailList);
				
		return "my_page/orderDetail";
	}
	
	// 주문취소
	@RequestMapping("cancel.do")
	public String cancel(Model model, @RequestParam("op_no") int op_no) throws Exception{
		int result = ops.cancel(op_no);
		System.out.println("주문취소 :" + result);
		model.addAttribute("result", result);
		
		return "my_page/cancelResult";
	}
	
	// 환불 요청 작성 폼
	@RequestMapping("refund.do")
	public String refund(Model model, @RequestParam("op_no") int op_no) throws Exception{
		model.addAttribute("op_no", op_no);
		
		return "my_page/refundForm";
	}
	
	// 환불 요청 접수
	@RequestMapping("refundForm.do")
	public String refundForm(Model model, Order_productDTO opdto, @RequestParam("op_no") int op_no, 
							@RequestParam("op_refund_why") String op_refund_why) throws Exception{
		
		opdto.setOp_no(op_no);
		opdto.setOp_refund_why(op_refund_why);
		
		int result = ops.refundForm(opdto);
		System.out.println("result: "+result);
		
		return "redirect:orderlist.do";
		
	}
	
}
