package market.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import market.model.MemberDTO;

public class CartInterceptor implements HandlerInterceptor{
	static final Logger logger = LoggerFactory.getLogger(CartInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String m_email = (String)session.getAttribute("m_email");
		
		if(m_email == null) {
			
			out.print("<script> alert('로그인이 필요한 서비스입니다.');</script>");
			out.print("<script> location.href='loginForm.do'; </script>");
			out.close();
			
			return false;
		}else {
			return true;
		}	
	}	
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
	
}
