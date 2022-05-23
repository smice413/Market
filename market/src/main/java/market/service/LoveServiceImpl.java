package market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.LoveDAO;
import market.model.LoveDTO;

@Service
public class LoveServiceImpl implements LoveService{
	@Autowired
	private LoveDAO ld;

	public int getTotal(LoveDTO love) {
		return ld.getTotal(love);
	}

	public List<LoveDTO> list(LoveDTO love) {
		return ld.list(love);
	}

	public int insert(LoveDTO love) {
		return ld.insert(love);
	}

	public int delete(int love_no) {
		return ld.delete(love_no);
	}
}
