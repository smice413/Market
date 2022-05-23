package market.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import market.model.ProductDTO;
import market.model.ReviewDTO;
import market.service.ReviewServiceImpl;

@Controller
public class ReviewController {

	@Autowired
	private ReviewServiceImpl rs;
	
	// 리뷰 작성 폼
	@RequestMapping("reviewForm.do")
	public String reviewForm(Model model, @RequestParam("p_no") int p_no,
							 HttpSession session) throws Exception{
		
		// session 에서 이메일 구해오기
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("이메일: "+m_email);
		
		// 상품명 구해오기
		ProductDTO product = rs.getProductName(p_no);
		
		model.addAttribute("product", product);
		model.addAttribute("m_email", m_email);
		
		return "review/reviewForm";
	}
	
	// 리뷰 작성
	@RequestMapping(value = "reviewInsert.do", method = RequestMethod.POST)
	public String reviewInsert(Model model, ReviewDTO review,
			/* @RequestParam(value="review_img[]") List<MultipartFile> review_img, */
							   MultipartHttpServletRequest multi,
							   HttpServletRequest request, String img) throws Exception{
		
		int result = 0;
		int result1 = 0;
		

		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		
		if(multi.getFiles("review_img").get(0).getSize() != 0) {
			fileList = multi.getFiles("review_img");
		}
		
		// 저장 경로
		String contextRoot = request.getRealPath("upload");
		String path = contextRoot + "/review";
		System.out.println("path: "+path);
		
		for (MultipartFile mf : fileList) {
			int size = (int) mf.getSize();	// 첨부파일의 크기 (byte)
			String originalFileName = mf.getOriginalFilename();	// 원래 파일 이름
			String savedFileName = System.currentTimeMillis() + originalFileName;
			
			System.out.println("originalFileName: "+ originalFileName);
			System.out.println("savedFileName: "+ savedFileName);
		
			if(size > 1024 * 1000) {	// 10MB
				result = 2;		// 파일 크기 10MB 초과
			}
			
			mf.transferTo(new File(path + "/" + savedFileName));
			System.out.println("사진입력");			
			
			img += savedFileName + "/";	
		}	// for end
		
		review.setR_img(img);
		
		result1 = rs.insert(review);
		System.out.println("입력 결과:"+result1);
		
		model.addAttribute("result", result);
		model.addAttribute("result1", result1);
		
		return "review/reviewResult";
	}
	
	// 내가 쓴 리뷰 목록 불러오기
	@RequestMapping("myReviewList.do")
	public String myReviewList(HttpSession session, Model model) throws Exception{
		String m_email = (String) session.getAttribute("m_email");
		
		// 내가 쓴 리뷰 개수
		int reviewCount = rs.reviewCount(m_email);
		
		// 리뷰 목록
		List<ReviewDTO> reviewList = rs.myReviewList(m_email);
		
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("reviewList", reviewList);
		
		return "review/myReviewList";
	}
	
	// 리뷰 상세 
	@RequestMapping("reviewDetail.do")
	public String reviewDetail(@RequestParam("r_no") int r_no, 
							   @RequestParam("p_no") int p_no,
							   Model model, ReviewDTO review) throws Exception{
		
		// 조회수 증가
		int result = rs.updateHit(r_no);
		System.out.println("조회수 증가 결과: "+ result);
		
		// 상품명
		ProductDTO product = rs.getProductName(p_no);
		
		// 리뷰 내용 구해오기
		review = rs.select(r_no);
		System.out.println("리뷰 상세 내용: "+review);
		
		String content = review.getR_content().replace("\n","<br>");
		String imgs = review.getR_img();
		
		String[] img = imgs.split("/");
		
		model.addAttribute("review", review);
		model.addAttribute("content", content);
		model.addAttribute("product", product);
		model.addAttribute("img", img);
		
		return "review/reviewDetail";
	}
	
	// 리뷰 삭제
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(Model model, @RequestParam("r_no") int r_no) throws Exception{
		
		// r_delstatus 값 Y로 업데이트
		int result = rs.delete(r_no);
		System.out.println("리뷰 삭제 결과: "+ result);
		
		model.addAttribute("result", result);
		
		return "review/reviewDeleteResult";
	}
}
