package market.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.model.CategoryDTO;
import market.model.ProductDTO;
import market.model.Product_imgDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<ProductDTO> list(ProductDTO product){
		return sst.selectList("productns.list", product);
	}
	
	public int getTotal(ProductDTO product) {
		return sst.selectOne("productns.getTotal", product);
	}
	
	public int insert(ProductDTO product) {
		return sst.insert("productns.insert", product);
	}

	public ProductDTO select(int p_no) {
		return sst.selectOne("productns.select", p_no);
	}
	
	public void selectUpdate(int p_no) {
		sst.update("productns.selectUpdate", p_no);
	}
	
	public int update(ProductDTO product) {
		return sst.update("productns.update", product);
	}
	
	public int delete(int p_no) {
		return sst.update("productns.delete", p_no);
	}

	public int getMaxNum() {
		return sst.selectOne("productns.getMaxNum");
	}
	
	public List<CategoryDTO> listCategory(ProductDTO product) {
		return sst.selectList("productns.listCategory", product);
	}
	
	public List<CategoryDTO> listCateNo(){
		return sst.selectList("productns.listCateNo");
	}

	public int insertImg(Product_imgDTO product_img) {
		return sst.insert("productns.insertImg", product_img);
	}

	public List<Product_imgDTO> listImg(int p_no) {
		return sst.selectList("productns.listImg", p_no);
	}	
}
