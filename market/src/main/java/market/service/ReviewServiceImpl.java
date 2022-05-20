package market.service;

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
}
