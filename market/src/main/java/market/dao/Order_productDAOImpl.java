package market.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.model.Order_productDTO;

@Repository
public class Order_productDAOImpl implements Order_productDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<Order_productDTO> orderlist() throws Exception{
		return sst.selectList("order_product.orderlist");
	}
	
	public Order_productDTO orderdetail(int op_no) throws Exception{
		return sst.selectOne("order_product.orderdetail", op_no);
	}
	
	public int cancel(int op_no) throws Exception{
		return sst.update("order_product.cancel", op_no);
	}
	
	public int refundForm(Order_productDTO opdto) throws Exception{
		return sst.update("order_product.refundForm", opdto);
	}
}
