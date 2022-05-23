package market.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.OrderDAO;
import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.OrderPageItemDTO;

@Service
public class OrderServiceImpl implements OrdereService{

	@Autowired
	private OrderDAO od;

	@Override
	public List<OrderPageItemDTO> getProductInfo(List<OrderPageItemDTO> orders) {

		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();		
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO productInfo = od.getProductInfo(ord.getCart_no());			

			productInfo.setCart_qty(ord.getCart_qty());
			
			productInfo.totalPrice();
			System.out.println("productInfo:"+productInfo);
			
			result.add(productInfo);			
		}		
		
		return result;
		
	}

	@Override
	public DeliveryDTO getDeliveryInfo(String m_email) {
		System.out.println("OrderServiceImpl");
		return od.getDeliveryInfo(m_email);
	}

	@Override
	public int getAddressCount(String m_email) {
		return od.getAddressCount(m_email);
	}
	
	@Override
	public int deliveryInsertY(DeliveryDTO delivery) {
		return od.deliveryInsertY(delivery);
	}
	
	@Override
	public int deliveryInsertN(DeliveryDTO delivery) {
		return od.deliveryInsertN(delivery);
	}

	@Override
	public List<DeliveryDTO> getDeliveryList(String m_email) {
		return od.getDeliveryList(m_email);
	}

	@Override
	public int UpdateDefaultN(String m_email) {
		return od.UpdateDefaultN(m_email);
	}

	@Override
	public int UpdateDefaultY(int d_no) {
		return od.UpdateDefaultY(d_no);
	}

	@Override
	public int addressUpdate(DeliveryDTO delivery) {
		return od.addressUpdate(delivery);
	}


	
}
