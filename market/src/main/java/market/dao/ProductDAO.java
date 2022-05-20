package market.dao;

import java.util.List;

import market.model.CategoryDTO;
import market.model.ProductDTO;
import market.model.Product_imgDTO;

public interface ProductDAO {
	
	List<ProductDTO> list(ProductDTO product);
	
	int getTotal(ProductDTO product);
	
	int insert(ProductDTO product);
	
	ProductDTO select(int p_no);
	
	void selectUpdate(int p_no);
	
	int update(ProductDTO product);
	
	int delete(int p_no);

	int getMaxNum();
	
	List<CategoryDTO> listCategory(ProductDTO product);
	
	List<CategoryDTO> listCateNo();
	
	int insertImg(Product_imgDTO product_img);
}
