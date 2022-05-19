package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.busanonna_tour.vo.Board;
import global.sesoc.busanonna_tour.vo.Member;


@Repository
public class MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	@Autowired
	SqlSession sqlSession;
	
	public int insert(Member member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;
		
		result = mapper.insert(member);
		return result; 
		
	}

	public Member getMember(String id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		Member result = null; 
		
		result = mapper.getMember(id);
		return result; 
	
	}

	public int updateMember(Member member) {
	    MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	    int result = 0;
	    
	    result = mapper.updateMember(member);
		return result;
	}

	//회원 탈퇴 
	public int deleteMember(Member member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	    int result = 0;
	    
	    result = mapper.deleteMember(member);
		return result;
		
	}
	
	
	
}
