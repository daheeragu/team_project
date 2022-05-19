package global.sesoc.web5.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web5.vo.Board;
import global.sesoc.web5.vo.Reply;

@Repository
public class BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

	@Autowired
	SqlSession sqlSession;
	
	//글쓰기
	public int write(Board board) {
	    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	    int result = 0; 
	    
	    result = mapper.write(board);
	    return result; 
		
	}
	//글개수
	public int getTotal(String searchText) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = 0; 
		    
		result = mapper.getTotal(searchText);
	    return result;
	}
	//글목록
	public ArrayList<Board> list(String searchText, int startRecord, int countPerPage) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<Board> result = mapper.listBoard(searchText, rb);
		return result;
	}
	
	//게시판 글읽기
	public Board readBoard(int boardnum) {
		 BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		 
		 //조회수 1증가(업데이트)
		 mapper.addHits(boardnum);
		 //해당 번호의 글정보 읽기
		 Board board = mapper.readBoard(boardnum);
		
		 
		 return board; 
	}
    //글 수정
	public int updateBoard(Board board) {
	    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	    int result = 0; 
	    
	    result = mapper.updateBoard(board);
	    return result; 
		
	}
	//글 삭제
	public int deleteBoard(Board board) {
	      BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	       int result = 0; 
	       
	       result = mapper.deleteBoard(board);
	       return result; 
	      
	   }
   //리플 추가
	public int insertReply(Reply reply) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	    int result = 0; 
	   
	    result = mapper.insertReply(reply);
	    return result; 
		
	}
   //한 게시물의 리플 목록
	public ArrayList<Reply> listReply(int boardnum) {
		 BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		  ArrayList<Reply> result = null; 
		    
		  result = mapper.listReply(boardnum);
		  return result;
	
	}
   //리플 삭제
	public int deleteReply(Reply reply) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	       int result = mapper.deleteReply(reply);
	       return result; 
		
	}

	
}
