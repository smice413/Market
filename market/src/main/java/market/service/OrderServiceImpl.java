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
	public OrderPageItemDTO getProductInfo(int cart_no){	
		return od.getProductInfo(cart_no);
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
	public int deliveryInsert(DeliveryDTO delivery) {
		return od.deliveryInsert(delivery);
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

	@Override
	public int deleteAddr(int d_no) {
		return od.deleteAddr(d_no);
	}

	@Override
	public DeliveryDTO getDelivery(int d_no) {
		// TODO Auto-generated method stub
		return od.getDelivery(d_no);
	}


	
}
