package global.sesoc.busanonna_tour.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.busanonna_tour.vo.user.Admin;
import global.sesoc.busanonna_tour.vo.user.Userinfo;

@Repository
public class UserDAO {
	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

	@Autowired
	SqlSession sqlSession;

	// 유저 검색
	public Userinfo selectUserinfo(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		Userinfo user = null;
		user = mapper.selectUserinfo(id);
		return user;
	}

	// 유저 등록
	public int insertUserinfo(Userinfo user) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		result = mapper.insertUserinfo(user);
		return result;
	}

	// 관리자 검색
	public Admin selectAdmin(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		Admin admin = null;
		admin = mapper.selectAdmin(id);
		return admin;
	}

	// 유저 정보 수정
	public int updateUserinfo(Userinfo user) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		result = mapper.updateUserinfo(user);
		return result;
	}
	
	// 관리자 정보 수정
	public int updateAdmin(Admin admin) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		result = mapper.updateAdmin(admin);
		return result;
		
	}

}
