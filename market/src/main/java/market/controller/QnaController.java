package market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import market.model.ProductDTO;
import market.model.QnaDTO;
import market.model.ReplyBoard;
import market.service.PagingPgm;
import market.service.ProductService;
import market.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qs;
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping("qna/list.do")	// 전체 목록, 검색 목록
	public String list(String pageNum, QnaDTO qna, Model model) {
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		int total = qs.getTotal(qna); // 검색 (데이터 갯수)
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		System.out.println("startRow:"+startRow);
		System.out.println("endRow:"+endRow);
		
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);

		int no = total - startRow + 1;		// 화면 출력 번호
		List<QnaDTO> list = qs.list(qna);
		System.out.println("list:"+list);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", qna.getSearch());
		model.addAttribute("keyword", qna.getKeyword());
		
		return "qna/list";
	}

	@RequestMapping("qnaList.do")	// 전체 목록, 검색 목록
	
	public String qnaList(String pageNum, String pagecase, QnaDTO qna, Model model) {
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		int total = qs.getTotal(qna); // 검색 (데이터 갯수)
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		System.out.println("startRow:"+startRow);
		System.out.println("endRow:"+endRow);
		System.out.println("search:"+ qna.getSearch());
		System.out.println("keyword:"+ qna.getKeyword());
		System.out.println("pagecase:"+ pagecase);
		
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);

		int no = total - startRow + 1;		// 화면 출력 번호
		List<QnaDTO> list = qs.list(qna);
		System.out.println("list:"+list);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", qna.getSearch());
		model.addAttribute("keyword", qna.getKeyword());
		model.addAttribute("pagecase", pagecase);
		
		return "qna/qnaList";
	}	


	@RequestMapping("qnaMainList.do")	// 글작성 폼 (원문, 답변글)
	public String insertForm(String p_no,  Model model) {


		
		return "qna/qnaMainList";
	}
	
	@RequestMapping("qnaInsertForm.do")	// 글작성 폼 (원문, 답변글)
	public String qnaInsertForm(int p_no, Model model) {

		ProductDTO product = ps.select(p_no);
		System.out.println("product:"+product);
		model.addAttribute("product", product);
		
		return "qna/qnaInsertForm";
	}

	@RequestMapping("qnaInsert.do")	// 글 작성
	public String insert(QnaDTO qna, Model model) {

		System.out.println("p_no:"+qna.getP_no());
		System.out.println("op_no:"+qna.getOp_no());
		System.out.println("m_email:"+qna.getM_email());
		System.out.println("qna_title:"+qna.getQna_title());
		System.out.println("qna_question:"+qna.getQna_question());
		System.out.println("qna_answer:"+qna.getQna_answer());
		System.out.println("qna_secret:"+qna.getQna_secret());
		System.out.println("s_no:"+qna.getS_no());
		if (qna.getQna_secret() == null) {
			qna.setQna_secret("N");
		}
		
		int p_no = qna.getP_no();
		System.out.println("qna_secret:"+qna.getQna_secret());		
		qs.insert(qna);
		
			
		return "redirect:qna/list.do?p_no=" + p_no+"#menu2";
	}


	@RequestMapping("qnaAnswerForm.do")	// 글작성 폼 (원문, 답변글)
	public String answerForm(int qna_no, Model model) {

		QnaDTO qna = qs.select(qna_no);
		System.out.println("p_no:"+qna.getP_no());
		System.out.println("op_no:"+qna.getOp_no());
		System.out.println("m_email:"+qna.getM_email());
		System.out.println("qna_title:"+qna.getQna_title());
		System.out.println("qna_question:"+qna.getQna_question());
		System.out.println("qna_answer:"+qna.getQna_answer());
		System.out.println("qna_secret:"+qna.getQna_secret());
		System.out.println("s_no:"+qna.getS_no());
		
		model.addAttribute("qna", qna);
		
		return "qna/qnaAnswerForm";
	}

	@RequestMapping("qnaAnswer.do")	
	public String qnaAnswer(QnaDTO qna,  Model model) {

		System.out.println("qna_answer:"+qna.getQna_answer());
		System.out.println("s_no:"+qna.getS_no());
		int s_no = qna.getS_no();
		qs.answer(qna);
		System.out.println("s_no:"+qna.getS_no());
		return "redirect:qnaList.do?search=s_no&keyword=" + s_no;
	}	

	@RequestMapping("qna/view.do")	// 상세 페이지
	public String view(int qna_no, String pageqna_no, Model model) {
		qs.readcountUpdate(qna_no);	// 조회수 증가
		QnaDTO qna = qs.select(qna_no);
		model.addAttribute("qna", qna);
		
		return "qna/view";
	}

	@RequestMapping("qna/updateForm.do")	// 수정 폼
	public String updateForm(int qna_no, String pageNum, Model model) {
		QnaDTO qna = qs.select(qna_no);
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		
		return "qna/updateForm";
	}

	@RequestMapping("qna/update.do")	// 수정
	public String update(QnaDTO qna, String pageNum, Model model) {
		int result = qs.update(qna);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "qna/update";
	}
//
//	@RequestMapping("qna/deleteForm.do")
//	public String deleteForm(int qna_no, String pageNum, Model model) {
//		QnaDTO qna = qs.select(qna_no);
//		model.addAttribute("qna", qna);
//		model.addAttribute("pageNum", pageNum);
//		
//		return "qna/deleteForm";
//	}
//
//	@RequestMapping("qna/delete.do")
//	public String delete(int qna_no, String pageNum, Model model) {
//		int result = qs.delete(qna_no);
//		model.addAttribute("result", result);
//		model.addAttribute("pageNum", pageNum);
//		
//		return "qna/delete";
//	}
}