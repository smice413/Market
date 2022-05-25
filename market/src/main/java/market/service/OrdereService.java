package market.service;

import java.util.HashMap;
import java.util.List;

import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.OrderPageItemDTO;
import market.model.Order_tabDTO;

public interface OrdereService {
	
	// 주문페이지
	public OrderPageItemDTO getProductInfo(int cart_no);
	DeliveryDTO getDeliveryInfo(String m_email);
	int getAddressCount(String m_email);
	int deliveryInsert(DeliveryDTO delivery);
	List<DeliveryDTO> getDeliveryList(String m_email);
	int UpdateDefaultN(String m_email);
	int UpdateDefaultY(int d_no);
	int addressUpdate(DeliveryDTO delivery);
	int deleteAddr(int d_no);
	DeliveryDTO getDelivery(int d_no);
	
	// 주문 처리
	// 주문 
	public void order(Order_tabDTO otd);
}
