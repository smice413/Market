package market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.ReviewDAOImpl;
import market.model.ProductDTO;
import market.model.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAOImpl rd;
	
	public ProductDTO getProductName(int p_no) throws Exception{
		ProductDTO product = rd.getProductName(p_no);
		return product;
	}
	
	public int insert(ReviewDTO review) throws Exception{
		int result = rd.insert(review);
		return result;
	}
	
	public List<ReviewDTO> myReviewList(String m_email) throws Exception{
		List<ReviewDTO> reviewList = rd.myReviewList(m_email);
		return reviewList;
	}
	
	public int updateHit(int r_no) throws Exception{
		int result = rd.updateHit(r_no);
		return result;
	}
	
	public ReviewDTO select (int r_no) throws Exception{
		ReviewDTO review = rd.select(r_no);
		return review;
	}
}
