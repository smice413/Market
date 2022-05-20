package market.controller;

import java.io.File;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import market.model.ShopDTO;
import market.service.ShopServiceImpl;



@Controller
public class ShopController {
	@Autowired
	private ShopServiceImpl shopService;
	
	// 회원가입 폼
	@RequestMapping("shop_join_form.do")
	public String shop_join_form() {
		return "shop/shop_join_form";
	}
	// email중복검사 ajax함수로 처리부분
	@RequestMapping(value = "shop_emailcheck.do", method = RequestMethod.POST)
	public String shop_checkemail(@RequestParam("email") String s_email, Model model) throws Exception {
	System.out.println("s_email:"+s_email);
			
	int result = shopService.shop_emailcheck(s_email);
	model.addAttribute("result", result);

	return "shop/emailCheckResult";
	}
	// 회원가입 저장
	@RequestMapping(value = "shop_join.do", method = RequestMethod.POST )
	public String shop_join(@RequestParam("s_file1") MultipartFile mf, 
			 								ShopDTO shop,
			 								HttpServletRequest request,
			 								Model model) throws Exception {
		System.out.println("ShopDTO:"+ shop);
		System.out.println("mf:"+ mf);
		
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();// 첨부파일 크기
		
		String path = request.getRealPath("upload/shop");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result=0;
		
		String file[] = new String[2];
		String newfilename="";
		
		if(filename != "") { //첨부파일이 전송된 경우
			
			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:"+ extension);
			
			UUID uuid = UUID.randomUUID();
			
			newfilename = uuid.toString()+extension;
			System.out.println("newfilename:"+ newfilename);
			
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken(); //파일명
			file[1] = st.nextToken(); //확장자 jpg
			
			if(size > 10000000) { //10MB
				result=1;
				model.addAttribute("result", result);
				
				return "shop/uploadResult";
			}else if(!file[1].equals("jpg") &&
					 !file[1].equals("gif") &&
					 !file[1].equals("png") ){
				
				result=2;
				model.addAttribute("result", result);
				
				return "shop/uploadResult";
			}
		}
			
			if(size > 0) { //첨부파일이 전송된 경우
				mf.transferTo(new File(path + "/" + newfilename));
			}
		
		
			
			shop.setS_file(newfilename);
			
			
		int result1=0;	
		result1 =shopService.insertShop_join(shop);
		
		model.addAttribute("result1", result1);
		return "shop/joinResult";
	}
	// 판매자 페이지 경로
	@RequestMapping("shop_page.do")
	public String shop_page() {
		return "shop_page/shop_page";
	}
	// 로그인 폼
	@RequestMapping("shop_login_form.do")
	public String shop_login_form() {
		return "shop/shop_login_form";
	}
	// 로그인 인증
	@RequestMapping(value= "shop_login.do", method=RequestMethod.POST)
	public String shop_login(@RequestParam("s_email") String s_email,
							 @RequestParam("s_passwd") String s_passwd,
							 HttpSession session, Model model) throws Exception {
		int result = 0;
		ShopDTO shop= shopService.userCheck(s_email);
		
		if(shop == null) { // 등록되지 않은 회원
			result= 1;
			model.addAttribute("result", result);
			return "shop/loginResult";
			
		}else {	// 등록된 회원 일때
		if(shop.getS_passwd().equals(s_passwd)) {
			session.setAttribute("s_email", s_email);
			model.addAttribute("shop", shop);
			
			return "shop_page/shop_page";
			
		}else { // 비번이 다를 때
			
			result = 2;
			model.addAttribute("result", result);
			
			return "shop/loginResult";
		}
    }
  }
	
	//상점 정보 보기
		@RequestMapping("shop_info.do")
		public String shop_info(HttpSession session, Model model)throws Exception {
			
			String s_email = (String) session.getAttribute("s_email");
			
			ShopDTO shop= shopService.userCheck(s_email);
			model.addAttribute("shop", shop);
			
			return "shop/shop_info_form";
		}
	//상점 정보 수정 폼
		@RequestMapping("shop_info_edit_form.do")
		public String shop_info_edit_form(HttpSession session, Model model)throws Exception{
			String s_email = (String) session.getAttribute("s_email");
					
			ShopDTO shop= shopService.userCheck(s_email);
			model.addAttribute("shop", shop);
					
			return "shop/shop_info_edit_form";
		}
	
	//상점 정보 수정
		@RequestMapping(value ="shop_info_edit.do", method = RequestMethod.POST)
		public String shop_info_edit(@RequestParam("s_file1") MultipartFile mf, 
									 ShopDTO shop,
									 HttpSession session,
									 HttpServletRequest request,
									 Model model)throws Exception {
		
			System.out.println("ShopDTO:"+ shop);
			System.out.println("mf:"+ mf);
			
			
			String filename = mf.getOriginalFilename();
			int size = (int) mf.getSize();// 첨부파일 크기
			
			String path = request.getRealPath("upload/shop");
			System.out.println("mf=" + mf);
			System.out.println("filename=" + filename); // filename="Koala.jpg"
			System.out.println("size=" + size);
			System.out.println("Path=" + path);
			int result=0;
			
			String file[] = new String[2];
			String newfilename="";
			
			if(filename != "") { //첨부파일이 전송된 경우
				
				// 파일 중복문제 해결
				String extension = filename.substring(filename.lastIndexOf("."), filename.length());
				System.out.println("extension:"+ extension);
				
				UUID uuid = UUID.randomUUID();
				
				newfilename = uuid.toString()+extension;
				System.out.println("newfilename:"+ newfilename);
				
				StringTokenizer st = new StringTokenizer(filename, ".");
				file[0] = st.nextToken(); //파일명
				file[1] = st.nextToken(); //확장자 jpg
				
				if(size > 10000000) { //10MB
					result=1;
					model.addAttribute("result", result);
					
					return "shop/uploadResult";
				}else if(!file[1].equals("jpg") &&
						 !file[1].equals("gif") &&
						 !file[1].equals("png") ){
					
					result=2;
					model.addAttribute("result", result);
					
					return "shop/uploadResult";
				}
			}
				
				if(size > 0) { //첨부파일이 전송된 경우
					mf.transferTo(new File(path + "/" + newfilename));
				}	
			
		    String s_email = (String) session.getAttribute("s_email");	
			
		    ShopDTO no_editfile = shopService.userCheck(s_email);
			
		    if(size>0) {	//첨부 파일이 수정됨
		    	shop.setS_file(newfilename);
		    }else {			//첨부 파일이 수정되지 않으면 다시 넣어줌
		    	shop.setS_file(no_editfile.getS_file());
		    }
		    
		    shop.setS_email(s_email);
		    
		    int result1;
		    result1 =shopService.shop_info_edit(shop);
		    
		    model.addAttribute("result1", result1);
		    
			return "redirect:shop_info.do";
		}
	
}
