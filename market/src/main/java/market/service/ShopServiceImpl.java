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
}