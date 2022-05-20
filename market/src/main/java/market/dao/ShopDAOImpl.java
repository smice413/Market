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
  
  // email 중복검사
  public int shop_emailcheck(String s_email)throws Exception {
	  
	  int re = -1;	// 사용 가능한 ID
	  
	  ShopDTO s = sqlsession.selectOne("shopns.shop_select", s_email);
	  if (s != null)
		  re = 1; 	// 중복id
		
	  return re;
		 
	}
  // 상점 정보 수정
  public int shop_info_edit(ShopDTO shop)throws Exception {
	  return sqlsession.update("shopns.shop_update", shop);
  }
  
}
