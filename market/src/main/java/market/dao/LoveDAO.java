package market.dao;

import java.util.List;

import market.model.LoveDTO;

public interface LoveDAO {
	
	int getTotal(LoveDTO love);
	
	List<LoveDTO> list(LoveDTO love);
	
	int insert(LoveDTO love);
	
	int delete(int love_no);
}
