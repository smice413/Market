package market.dao;

import java.util.List;

import market.model.CartDTO;
import market.model.DeliveryDTO;

public interface OrderDAO {
	List<CartDTO> getCartInfo(String m_email);
	DeliveryDTO getDeliveryInfo(String m_email);
}
