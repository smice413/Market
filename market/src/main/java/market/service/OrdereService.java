package market.service;

import java.util.HashMap;
import java.util.List;

import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.OrderPageItemDTO;

public interface OrdereService {
	public List<OrderPageItemDTO> getProductInfo(List<OrderPageItemDTO> orders);
	DeliveryDTO getDeliveryInfo(String m_email);
	int getAddressCount(String m_email);
	int deliveryInsertY(DeliveryDTO delivery);
	int deliveryInsertN(DeliveryDTO delivery);
	List<DeliveryDTO> getDeliveryList(String m_email);
	int UpdateDefaultN(String m_email);
	int UpdateDefaultY(int d_no);
	int addressUpdate(DeliveryDTO delivery);
}
