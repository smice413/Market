package market.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.model.ShopDTO;

@Repository
public class ShopDAOImpl {
  @Autowired
  private SqlSession sqlsession;
  
  // 회원가입
  public int insertShop_join(ShopDTO shop) throws Exception {
	  return sqlsession.insert("shopns.shop_insert", shop);
  }
  
  // 로그인 인증
  public ShopDTO userCheck(String s_email) throws Exception {
	  return sqlsession.selectOne("shopns.shop_select", s_email);
  }
  
}
