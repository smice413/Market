package market.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.model.CartDTO;
import market.model.DeliveryDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<CartDTO> getCartInfo(String m_email) {
		return sst.selectList("cartns.list", m_email);
	}

	@Override
	public DeliveryDTO getDeliveryInfo(String m_email) {
		return sst.selectOne("orderpagens.getDeliveryInfo", m_email);
	}


	@Override
	public int getAddressCount(String m_email) {
		return sst.selectOne("orderpagens.getAddressCount", m_email);
	}
	
	@Override
	public int deliveryInsertY(DeliveryDTO delivery) {
		return sst.insert("orderpagens.deliveryInsertY", delivery);
	}
	
	@Override
	public int deliveryInsertN(DeliveryDTO delivery) {
		return sst.insert("orderpagens.deliveryInsertN", delivery);
	}

	@Override
	public List<DeliveryDTO> getDeliveryList(String m_email) {
		return sst.selectList("orderpagens.getDeliveryList", m_email);
	}

	@Override
	public int UpdateDefaultN(String m_email) {
		return sst.update("orderpagens.UpdateDefaultN", m_email);
	}

	@Override
	public int UpdateDefaultY(int d_no) {
		return sst.update("orderpagens.UpdateDefaultY", d_no);
	}

	@Override
	public int addressUpdate(DeliveryDTO delivery) {
		return sst.update("orderpagens.addressUpdate", delivery);
	}
}
