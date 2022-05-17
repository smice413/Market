package market.service;

import java.util.List;

import market.model.CategoryDTO;
import market.model.ProductDTO;


public interface ProductService {

	List<ProductDTO> list(ProductDTO product);
	
	int getTotal(ProductDTO product);
	
	int insert(ProductDTO product);
	
	ProductDTO select(int p_no);
	
	void selectUpdate(int p_no);
	
	int update(ProductDTO product);
	
	int delete(int p_no);
	

	List<CategoryDTO> listCategory(ProductDTO product);

}
