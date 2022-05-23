package market.service;

import java.util.List;

import market.model.LoveDTO;

public interface LoveService {

	int getTotal(LoveDTO love);
	
	List<LoveDTO> list(LoveDTO love);
	
	int insert(LoveDTO love);
	
	int delete(int love_no);
}
