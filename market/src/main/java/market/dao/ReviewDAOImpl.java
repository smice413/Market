package market.dao;

import java.util.List;

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
	
	public List<ReviewDTO> myReviewList(String m_email) throws Exception{
		return sst.selectList("review.myReviewList", m_email);
	}
	
	public int updateHit(int r_no) throws Exception{
		return sst.update("review.updateHit", r_no);
	}
	
	public ReviewDTO select(int r_no) throws Exception{
		return sst.selectOne("review.select", r_no);
	}
}
