package market.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.model.Order_manageDTO;

@Repository
public class Order_tabDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int lastseq() {
		return sst.selectOne("order_tabns.lastseq");
	}
	
	public List<Order_manageDTO> olist() {
		return sst.selectList("order_managens.list");
	}

}
