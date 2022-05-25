package market.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import market.dao.CartDAO;
import market.dao.MemberDAO;
import market.dao.OrderDAO;
import market.dao.ProductDAO;
import market.model.CartDTO;
import market.model.DeliveryDTO;
import market.model.OrderPageItemDTO;
import market.model.Order_productDTO;
import market.model.Order_tabDTO;
import market.model.ProductDTO;

@Service
public class OrderServiceImpl implements OrdereService{

	@Autowired
	private OrderDAO od;
	
	@Autowired
	private CartDAO cd;
	
	@Autowired
	private ProductDAO pd;

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

	@Override
	@Transactional
	public void order(Order_tabDTO otd) {
		
		// 주문 정보
		List<Order_productDTO> otds = new ArrayList<>();
		for(Order_productDTO opd : otd.getOrders()) {
			Order_productDTO orderProduct = od.getOrderInfo(opd.getP_no());
			orderProduct.setOp_qty(otd.getCart_qty());
			orderProduct.total();
			otds.add(orderProduct);
		}
		otd.getOrders();
		otd.getOrderPriceInfo();
		
		// 주문,주문상품 테이블에 저장
		od.orderInsert(otd);  // order_tab 등록
		for(Order_productDTO opd : otd.getOrders()) {
			opd.setO_no(otd.getO_no());
			od.orderProductInsert(opd);  //order_product 등록
		}
		
		// 재고 변동 적용
		for(Order_productDTO opd : otd.getOrders()) {
			// 변동 재고 값 구하기
			ProductDTO product = od.productInfo(opd.getP_no());
			product.setP_stock(product.getP_stock()-opd.getOp_qty());
			
			od.updateStock(product);
		}
		
		// 장바구니 제거
		for(Order_productDTO opd : otd.getOrders()) {
			CartDTO cart = new CartDTO();
			cart.setM_email(otd.getM_email());
			cart.setP_no(opd.getP_no());
			
			cd.deleteOrderCart(cart);
		}
		
	}


	
}
