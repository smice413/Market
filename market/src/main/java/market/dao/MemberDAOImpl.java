package market.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;
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

	// 회원확인폼
	public int memberConfirmForm(MemberDTO member) throws Exception {
	return sqlSession.update("memberns.memberConfirmForm", member);
	}

	//회원확인
	public int memberConfirm(MemberDTO member)throws Exception{
		return sqlSession.update("memberns.memberConfirm", member);
	}
	//회원정보수정
	public int memberUpdate(MemberDTO member)throws Exception{
		return sqlSession.update("memberns.memberUpdate",member);
	}

	// 비밀번호찾기
	public MemberDTO passwdSearch(MemberDTO member) throws Exception {
		return sqlSession.selectOne("memberns.passwdSearch", member);
	}
	//아이디(이메일찾기)
	public MemberDTO emailSearch(MemberDTO member)throws Exception{
		List<MemberDTO> list = sqlSession.selectList("memberns.emailSearch", member);
		System.out.println(list.get(0));
		return (MemberDTO)list.get(0);
	}
	//회원삭제
	public int deleteMember(MemberDTO member)throws Exception{
		return sqlSession.update("memberns.deleteMember", member);
	}
}