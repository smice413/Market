package market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.Order_productDAO;
import market.dao.Order_tabDAO;
import market.model.Order_productDTO;
import market.model.Order_tabDTO;

@Service
public class ShopManageService {
	@Autowired
	private Order_tabDAO otdao;
	
	@Autowired
	private Order_productDAO opdao;

	// 주문리스트 불러오기
	public List<Order_tabDTO> olist() {
		return otdao.olist();
	}
	
	// 환불신청 리스트 불러오기
	public List<Order_productDTO> oplist() {
		return opdao.oplist();
	}
}
