package market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.Order_productDAOImpl;
import market.model.Order_productDTO;


@Service
public class Order_productServiceImpl implements Order_productService{

	@Autowired
	private Order_productDAOImpl opdao;
	
	public List<Order_productDTO> orderlist() throws Exception{
		return opdao.orderlist();
	}
	
	public Order_productDTO orderdetail(int op_no) throws Exception{
		Order_productDTO orderdetail = opdao.orderdetail(op_no);
		return orderdetail;
	}
	
	public int cancel(int op_no) throws Exception{
		int result = opdao.cancel(op_no);
		return result;
	}
	
	public int refundForm(Order_productDTO opdto) throws Exception{
		int result = opdao.refundForm(opdto);
		return result;
	}
}
