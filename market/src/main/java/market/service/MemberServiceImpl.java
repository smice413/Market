package market.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.dao.MemberDAO;
import market.dao.MemberDAOImpl;
import market.model.MemberDTO;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDAOImpl md;

	public int memberInsert(MemberDTO member) throws Exception {
		System.out.println("insert 서비스까지왔구나");
		return md.memberInsert(member);
	}

	public MemberDTO loginCheck(String m_email) throws Exception {
		System.out.println("로그인인증 슝");
		return md.loginCheck(m_email);
	}
	public MemberDTO select(String m_email) throws Exception{
		System.out.println("email: "+m_email);
		
		return md.select(m_email);
	}
	
	public MemberDTO passwdSearch(MemberDTO member)throws Exception{
		return md.passwdSearch(member);
	}
	public MemberDTO emailSearch(MemberDTO member)throws Exception{
		return md.emailSearch(member);
	}
	public int memberUpdateForm(MemberDTO member)throws Exception{
	 return md.memberUpdateForm(member); 
  }
	
	public int memberUpdate(MemberDTO member)throws Exception{
		return md.memberUpdate(member);
	}
	
	public int deleteMember(MemberDTO member)throws Exception{
		return md.deleteMember(member);
		
	}
}