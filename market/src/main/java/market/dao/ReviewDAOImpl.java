package market.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.model.ProductDTO;
import market.model.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public ProductDTO getProductName(int p_no) throws Exception {
		return sst.selectOne("review.getProductName", p_no);
	}
	
	public int insert(ReviewDTO review) throws Exception{
		return sst.insert("review.insert", review);
	}
}
