package market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.ShopDAOImpl;
import market.model.ShopDTO;

@Service
public class ShopServiceImpl {
	@Autowired
	private ShopDAOImpl shopDAO;
	// 회원가입
	public int insertShop_join(ShopDTO shop)throws Exception {
		return shopDAO.insertShop_join(shop);
	}
	// 로그인 인증
	public ShopDTO userCheck(String s_email)throws Exception {
		return shopDAO.userCheck(s_email);
	}
	// email중복 검사
	public int shop_emailcheck(String s_email)throws Exception {
		return shopDAO.shop_emailcheck(s_email);
	}
	
	// 상점 정보 수정
	public int shop_info_edit(ShopDTO shop)throws Exception {
		return shopDAO.shop_info_edit(shop);
	}
	
	// 폐점으로 바꾸기
	public void shop_del(ShopDTO dels)throws Exception {
		shopDAO.shop_del(dels);
	}
	
}