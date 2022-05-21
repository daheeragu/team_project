package global.sesoc.busanonna_tour.dao;

import global.sesoc.busanonna_tour.vo.user.Userinfo;

public interface UserMapper {

	public Userinfo selectUserinfo(String id);

	public int insertUserinfo(Userinfo user);

}
