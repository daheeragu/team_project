package global.sesoc.web5.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.web5.vo.Board;
import global.sesoc.web5.vo.Reply;

public interface BoardMapper {
    //글쓰기
	public int write(Board board);
	//글개수
	public int getTotal(String searchText);
    //글목록
	public ArrayList<Board> listBoard(String searchText, RowBounds rb);
	//게시판 글읽기
	public Board readBoard(int boardnum);
	//조회수 1증가
	public void addHits(int boardnum);
	//글 수정
	public int updateBoard(Board board);
	//글 삭제
	public int deleteBoard(Board board);
	//리플 추가
	public int insertReply(Reply reply);
	//리플 목록
	public ArrayList<Reply> listReply(int boardnum);
	//리플 삭제
	public int deleteReply(Reply reply);
}
