package global.sesoc.web5.dao;

import java.util.ArrayList;

import global.sesoc.web5.vo.Member;

public interface MemberMapper {

   //회원 가입
	public int insert(Member member);
   //로그인 
	public Member getMember(String id);
	//회원 정보 수정 
	public int updateMember(Member member);
	//회원 탈퇴
	public int deleteMember(Member member);
	
}
