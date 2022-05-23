package market.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.model.LoveDTO;

@Repository
public class LoveDAOImpl implements LoveDAO {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(LoveDTO love) {
		return sst.selectOne("lovens.getTotal", love);
	}

	public List<LoveDTO> list(LoveDTO love) {
		return sst.selectList("lovens.list", love);
	}

	public int insert(LoveDTO love) {
		return sst.insert("lovens.insert", love);
	}

	public int delete(int love_no) {
		return sst.update("lovens.delete", love_no);
	}
}
