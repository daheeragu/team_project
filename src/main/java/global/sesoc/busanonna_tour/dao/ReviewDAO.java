package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.busanonna_tour.vo.Board;
import global.sesoc.busanonna_tour.vo.Reply;
import global.sesoc.busanonna_tour.vo.review.Review;

@Repository
public class ReviewDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

	@Autowired
	SqlSession sqlSession;
	
	//리뷰 쓰기
	public int writeReview(Review review) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		int result = 0;
		
		result = mapper.writeReview(review);
		return result;
	}
	

//	//글개수
//	public int getTotal(String searchText) {
//		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
//		int result = 0; 
//		    
//		result = mapper.getTotal(searchText);
//	    return result;
//	}
	
	// 리뷰 목록
	public ArrayList<Review> reviewList() {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		ArrayList<Review> review = mapper.reviewList();
		return review;

	}
	
	// 리뷰 번호로 리뷰 검색
	public Review readReview(int review_num) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		Review review = null;
		review = mapper.readReview(review_num);
		return review;
	}

	// 리뷰 수정
	public int updateReview(Review review) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		int result = 0;
		result = mapper.updateReview(review);
		return result;
		
	}

	
	
//	//게시판 글읽기
//	public Board readBoard(int boardnum) {
//		 BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
//		 
//		 //조회수 1증가(업데이트)
//		 mapper.addHits(boardnum);
//		 //해당 번호의 글정보 읽기
//		 Board board = mapper.readBoard(boardnum);
//		
//		 
//		 return board; 
//	}

//		
//	}
//	//글 삭제
//	public int deleteBoard(Board board) {
//	      BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
//	       int result = 0; 
//	       
//	       result = mapper.deleteBoard(board);
//	       return result; 
//	      
//	   }
//   //리플 추가
//	public int insertReply(Reply reply) {
//		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
//	    int result = 0; 
//	   
//	    result = mapper.insertReply(reply);
//	    return result; 
//		
//	}
//   //한 게시물의 리플 목록
//	public ArrayList<Reply> listReply(int boardnum) {
//		 BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
//		  ArrayList<Reply> result = null; 
//		    
//		  result = mapper.listReply(boardnum);
//		  return result;
//	
//	}
//   //리플 삭제
//	public int deleteReply(Reply reply) {
//		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
//	       int result = mapper.deleteReply(reply);
//	       return result; 
//		
//	}
//
	
}
