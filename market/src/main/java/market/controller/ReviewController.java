package market.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
							   MultipartHttpServletRequest mRequest,
							   HttpServletRequest request) throws Exception{
		
		int result = 0;
		
		List<MultipartFile> fileList = mRequest.getFiles("review_img");
		
		// 저장 경로
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String path = contextRoot + "upload/review";
		System.out.println("path: "+path);
		
		for (MultipartFile mf : fileList) {
			int size = (int) mf.getSize();	// 첨부파일의 크기 (byte)
			String originalFileName = mf.getOriginalFilename();	// 원래 파일 이름
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));  // 확장자
			String savedFileName =UUID.randomUUID()+"_"+originalFileName;	// 저장될 파일명
		
			if(size > 1024 * 1000) {	// 10MB
				result = 2;		// 파일 크기 10MB 초과
			}
			
			try {
				mf.transferTo(new File(path + "/" + savedFileName));
				System.out.println("사진입력");
				
			}catch (IllegalStateException e) {
				e.printStackTrace();
				
			}catch (IOException e){
				e.printStackTrace();
			}
			
			review.setR_img(savedFileName + "/");
		}
		
		int result1 = 0;
		
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
		
		List<ReviewDTO> reviewList = rs.myReviewList(m_email);
		
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
		
		// 리뷰 내용 구해오기
		review = rs.select(r_no);
		System.out.println("리뷰 상세 내용: "+review);
		
		String content = review.getR_content().replace("\n","<br>");
		
		// 상품명 구해오기
		ProductDTO product = rs.getProductName(p_no);
		
		model.addAttribute("review", review);
		model.addAttribute("content", content);
		model.addAttribute("product", product);
		
		return "review/reviewDetail";
	}
}
