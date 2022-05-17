package market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import market.model.Board;
import market.service.BoardService;
import market.service.PagingPgm;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	
	@RequestMapping("list.do")	// 전체 목록, 검색 목록
	public String list(String pageNum, Board board, Model model) {
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		// int total = bs.getTotal();
		int total = bs.getTotal(board); // 검색 (데이터 갯수)
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int no = total - startRow + 1;		// 화면 출력 번호
		List<Board> list = bs.list(board);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", board.getSearch());
		model.addAttribute("keyword", board.getKeyword());
		
		return "board/list";
	}

	@RequestMapping("insertForm.do")	// 글작성 폼 (원문, 답변글)
	public String insertForm(String nm, String pageNum, Model model) {
		int num = 0, ref = 0, re_level = 0, re_step = 0; // 원문
		if (nm != null) {	// 답변글
			num = Integer.parseInt(nm);
			Board board = bs.select(num);	// 부모글 정보 구해오기
			ref = board.getRef();
			re_level = board.getRe_level();
			re_step = board.getRe_step();
		}
		model.addAttribute("num", num);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		model.addAttribute("pageNum", pageNum);
		
		return "board/insertForm";
	}

	@RequestMapping("insert.do")	// 글 작성
	public String insert(Board board, Model model, HttpServletRequest request) {
		int num = board.getNum();
		int number = bs.getMaxNum();
		if (num != 0) {		// 답변글
			bs.updateRe(board);
			board.setRe_level(board.getRe_level() + 1);
			board.setRe_step(board.getRe_step() + 1);
		} else				
			board.setRef(number); //원문
		// 원문 + 답글
			board.setNum(number);
			String ip = request.getRemoteAddr();
			board.setIp(ip);
			int result = bs.insert(board);
			model.addAttribute("result", result);
			
		return "board/insert";
	}

	@RequestMapping("view.do")	// 상세 페이지
	public String view(int num, String pageNum, Model model) {
		bs.selectUpdate(num);	// 조회수 증가
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/view";
	}

	@RequestMapping("updateForm.do")	// 수정 폼
	public String updateForm(int num, String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/updateForm";
	}

	@RequestMapping("update.do")	// 수정
	public String update(Board board, String pageNum, Model model) {
		int result = bs.update(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "board/update";
	}

	@RequestMapping("deleteForm.do")
	public String deleteForm(int num, String pageNum, Model model) {
		Board board = bs.select(num);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "board/deleteForm";
	}

	@RequestMapping("delete.do")
	public String delete(int num, String pageNum, Model model) {
		int result = bs.delete(num);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "board/delete";
	}
}