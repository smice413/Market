package market.dao;

import java.util.List;

import market.model.CartDTO;
import market.model.DeliveryDTO;

public interface OrderDAO {
	List<CartDTO> getCartInfo(String m_email);
	DeliveryDTO getDeliveryInfo(String m_email);
	int getAddressCount(String m_email);
	int deliveryInsertY(DeliveryDTO delivery);
	int deliveryInsertN(DeliveryDTO delivery);
	List<DeliveryDTO> getDeliveryList(String m_email);
	int UpdateDefaultN(String m_email);
	int UpdateDefaultY(int d_no);
	int addressUpdate(DeliveryDTO delivery);
}
