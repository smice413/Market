package market.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import market.model.MemberDTO;
import scala.collection.mutable.HashMap;

@Repository
public class MemberDAOImpl {

	@Autowired
	private SqlSession sqlSession;

	// 회원저장
	public int memberInsert(MemberDTO member) throws Exception {
		return sqlSession.insert("memberns.insertMember", member);
	}

	// 로그인인증
	public MemberDTO loginCheck(String m_email) throws Exception {
		System.out.println("로긴체크 dao도착");
		System.out.println("m_email: " + m_email);
		return sqlSession.selectOne("memberns.loginCheck", m_email);
	}

	// 회원정보가져오기
	public MemberDTO select(String m_email) throws Exception {
		return sqlSession.selectOne("memberns.select", m_email);
	}

	// 회원수정
	public int memberUpdateForm(MemberDTO member) throws Exception {
	return sqlSession.update("memberns.memberUpdateForm", member);
	}

	// 비밀번호찾기
	/*
	 * public int passwdSearch(String m_eamil, String m_name)throws Exception{
	 * Map<String, Object> map = new HashMap<String, Object>(); map.put("m_email",
	 * m_eamil); map.put("m_name", m_name);
	 * 
	 * return sqlSession.passwdSearch("memberns.passwdSearch", m_eamil, m_name); }
	 */
	// 비밀번호찾기
	public MemberDTO passwdSearch(MemberDTO member) throws Exception {
		return sqlSession.selectOne("passwdSearch", member);
	}
}