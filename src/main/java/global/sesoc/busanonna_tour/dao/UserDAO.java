package global.sesoc.busanonna_tour.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	@Autowired
	SqlSession sqlSession;
}
