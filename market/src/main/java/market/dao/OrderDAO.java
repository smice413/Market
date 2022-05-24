package market.dao;

import java.util.HashMap;
import java.util.List;

import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.OrderPageItemDTO;
import scala.PartialFunction.OrElse;

public interface OrderDAO {
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
}
