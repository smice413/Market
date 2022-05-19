package market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.ProductDAO;
import market.model.CategoryDTO;
import market.model.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO pd;

	public List<ProductDTO> list(ProductDTO product){
		return pd.list(product);
	}
	
	public int getTotal(ProductDTO product) {
		return pd.getTotal(product);
	}
	
	public int insert(ProductDTO product) {
		return pd.insert(product);
	}
	
	public ProductDTO select(int p_no) {
		return pd.select(p_no);
	}
	
	public void selectUpdate(int p_no) {
		pd.selectUpdate(p_no);
	}
	
	public int update(ProductDTO product) {
		return pd.update(product);
	}
	
	public int delete(int p_no) {
		return pd.delete(p_no);
	}


	public List<CategoryDTO> listCategory(ProductDTO product) {
		return pd.listCategory(product);
	}
	
	public List<CategoryDTO> listCateNo(){
		return pd.listCateNo();
	}
}
