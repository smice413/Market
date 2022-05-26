package market.service;

import java.util.List;

import market.model.QnaDTO;

public interface QnaService {
	
	int getTotal(QnaDTO qna);

	List<QnaDTO> list(QnaDTO qna);

	int getMaxNum();
	
	int insert(QnaDTO qna);
	
	int answer(QnaDTO qna);

	void readcountUpdate(int qna_no);
	
	QnaDTO select(int qna_no);

	int update(QnaDTO qna);

	int delete(int qna_no);

}