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
	
	public List<Order_manageDTO> olist(int s_no) {
		return sst.selectList("order_managens.list",s_no);
	}
	
	public List<Order_manageDTO> odlist(int o_no) {
		return sst.selectList("order_managens.odlist",o_no);
	}
	
	// 운송번호 입력
	public int deliNoInsert(Order_manageDTO omdto) {
		return sst.insert("order_managens.dinsert",omdto);
	}
	
	// 품절 취소 처리
	public int cancel(Order_manageDTO omdto) {
		return sst.insert("order_managens.cancel",omdto);
	}

}
