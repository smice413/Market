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
		System.out.println("OrderDAOImpl");
		return sst.selectOne("orderpagens.getDeliveryInfo", m_email);
	}
}
