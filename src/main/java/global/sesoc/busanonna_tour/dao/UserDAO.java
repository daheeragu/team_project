package global.sesoc.busanonna_tour.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.busanonna_tour.vo.user.Userinfo;

@Repository
public class UserDAO {
	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

	@Autowired
	SqlSession sqlSession;

	public Userinfo selectUserinfo(String id) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		Userinfo user = null;
		user = mapper.selectUserinfo(id);
		return user;
	}

	public int insertUserinfo(Userinfo user) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		result = mapper.insertUserinfo(user);
		return result;
	}
}
