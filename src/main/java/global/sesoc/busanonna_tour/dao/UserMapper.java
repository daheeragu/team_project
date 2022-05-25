package global.sesoc.busanonna_tour.dao;

import global.sesoc.busanonna_tour.vo.user.Admin;
import global.sesoc.busanonna_tour.vo.user.Userinfo;

public interface UserMapper {
	
	// ID로 유저 select
	public Userinfo selectUserinfo(String id);

	// 유저 등록(회원가입)
	public int insertUserinfo(Userinfo user);

	// ID로 관리자 select
	public Admin selectAdmin(String id);

	// ID로 관리자 업데이트
	public int updateAdmin(String loginId);

	// ID로 유저 업데이트
	public int updateUserinfo(String loginId);
}
