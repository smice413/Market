package market.dao;

import java.util.List;

import market.model.QnaDTO;

public interface QnaDAO {

	int getTotal(QnaDTO qna);

	List<QnaDTO> list(QnaDTO qna);

	int getMaxNum();
	
	int insert(QnaDTO qna);

	void readcountUpdate(int num);
	
	QnaDTO select(int num);

	int update(QnaDTO qna);

	int delete(int num);
}