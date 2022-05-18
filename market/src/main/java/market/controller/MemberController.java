package market.controller;

import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import market.dao.MemberDAO;
import market.model.MemberDTO;
import market.service.MemberServiceImpl;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl ms;
	private ServletRequest session;

//	// 메인페이지
//	@RequestMapping(value = "/main.do")
//	public String main() {
//		return "common/main";
//	}

	// 마이페이지
	@RequestMapping(value = "myPage.do")
	public String my_page() {
		return "my_page/myPage";

	}

	// 회원가입 폼
	@RequestMapping(value = "/memberInsertForm.do")
	public String memberInsertForm() {
		System.out.println("가입폼등장");
		return "member/memberInsertForm";

	}

	// 회원가입 저장
	@RequestMapping(value = "/memberInsert.do", method = RequestMethod.POST)
	public String memberInsert(MemberDTO member, Model model) throws Exception {
		System.out.println("좋아 저장됐다");
		
		int result = ms.memberInsert(member);
		if (result == 1)
			System.out.println("회원가입 성공");
		model.addAttribute("result", result);
		return "member/memberInsert";
	}

	// 로그인폼뷰
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그인인증
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public String loginCheck(String m_email, String m_passwd, HttpSession session, Model model) throws Exception {
		System.out.println("인증갔니 자래따");

		int result = 0;
		MemberDTO loginm = ms.loginCheck(m_email);

		if (loginm == null) { // 등록되지 않은 회원일때

			result = 1;
			model.addAttribute("result", result);

			return "member/loginCheck";

		} else { // 등록된 회원일때
			if (loginm.getM_passwd().equals(m_passwd)) {
				// session.setAttribute("m_email", m_email);
				System.out.println("M_passwd" + m_passwd);
				// String m_name = loginm.getM_name();

				session.setAttribute("m_email", loginm.getM_email());

				return "redirect:main.do";
			} else { // 비번이 다를때
				result = 2;
				model.addAttribute("result", result);

				System.out.println("돌아왔니 로긴 인증성공");
				return "member/loginCheck";
			}

		}
	}

	// 회원정보 수정 폼
	@RequestMapping(value = "/memberUpdateForm.do", method = RequestMethod.GET)
	public String memberUpdateForm(HttpSession session, Model model) throws Exception {

		String m_email = (String) session.getAttribute("m_email");
		System.out.println("email: " + m_email);

		MemberDTO old = ms.select(m_email);
		model.addAttribute("old", old);

		return "member/memberUpdateForm";
	}

	// 회원정보 수정
	@RequestMapping(value = "/memberUpdate.do", method = RequestMethod.POST) 
	public String memberUpdate(MemberDTO member, Model model) throws Exception {
		int result = ms.memberUpdate(member);
		model.addAttribute("result", result);
		
		return "member/updateResult";
		
		
/*		if(!member.getM_passwd().equals(m_passwd)){     //비번이 다른경우 
			result =2; 
			return "memberUpdate";
			
		}else {		
			int resultu = ms.memberInsert(member);
			ms.memberInsert(member);
			
			if (resultu == 1)
				System.out.println("정보수정 성공");
			model.addAttribute("result", resultu);*/

		
	}
	
	/*
	 * //회원정보보기 (회원리스트)
	 * 
	 * @RequestMapping(value = "/memberList.do", method = RequestMethod.get) public
	 * void memberList(HttpSession session, Model model)throws Exception{
	 * 
	 * String email = (String)session.getAttribute("email");
	 * 
	 * MemberDTO member = List list = MemberServiceImpl.select(email); int total =
	 * ms.getTotal(member);
	 * 
	 * model.addAttribute("md", md);
	 * 
	 * }
	 */
	//비번찾기 폼
	@RequestMapping(value = "/passwdSearchForm.do")
	public String passwdSearchForm() {
		return "member/passwdSearchForm";
	}

	//비번찾기 완료 
	@RequestMapping(value = "/passwdSearch.do", method = RequestMethod.POST)
	public String passwdCheck(@ModelAttribute MemberDTO member, HttpServletResponse response, Model model)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		MemberDTO mem = ms.passwdSearch(member);

		if (mem == null) {// 값이 없는 경우

			return "member/passwdSearchForm";

		} else {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "su_jin924@naver.com";
			String hostSMTPpwd = "000000"; // 비밀번호 입력해야함

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "su_jin924@naver.com";
			String fromName = "마켓관리자";
			String subject = "마켓의 비밀번호를 알려드립니다:-)";

			// 받는 사람 E-Mail 주소
			String mail = mem.getM_email();

			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg("<p align = 'center'>마켓 비밀번호 알려드립니다</p><br>" + "<div align='center'> 마켓 비밀번호  "
						+ mem.getM_passwd() + "</div>");
				email.send();
			} catch (Exception e) {
				System.out.println(e);
			}

			model.addAttribute("passwdSearch", "등록된 email을 확인 하세요:-)");
			return "member/loginForm";

		}

	}

	//로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "member/logout";
	}
	//회원탈퇴 폼
	@RequestMapping("memberDeleteForm.do")
	public String memberDelete(HttpSession session, Model model)throws Exception{
		
		String email = (String)session.getAttribute("m_email");
		MemberDTO deleteM = ms.select(email);
		System.out.println("db비번:" + deleteM.getM_passwd());
		
		
		model.addAttribute("m_email", email);
		model.addAttribute("deleteM", deleteM);

		System.out.println("탈퇴폼까지 왔다");
		return "member/memberDeleteForm";
	}
	
	//회원탈퇴 완료 
	@RequestMapping(value= "/memberDelete.do", method= RequestMethod.POST)
	public String memberDelete(HttpSession session, MemberDTO member, Model model)throws Exception{
				
		int result = ms.deleteMember(member);
		System.out.println("회원 탈퇴 결과:" + result);
		
		model.addAttribute("result", result);
		
		session.invalidate();		
		
		return "member/memberDeleteResult";
		
	}
}
							
	
	
	


