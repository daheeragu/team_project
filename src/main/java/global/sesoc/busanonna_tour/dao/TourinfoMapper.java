package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.busanonna_tour.vo.Board;
import global.sesoc.busanonna_tour.vo.Reply;
import global.sesoc.busanonna_tour.vo.tourinfo.Tourinfo;

public interface TourinfoMapper {
	//글개수
	public int getTotalSpot(String searchText);
	public int getTotalFood(String searchText);
	public int getTotalLeisure(String searchText);
	public int getTotalExp(String searchText);
	
    //글목록
	public ArrayList<Tourinfo> spotlist(String searchText, RowBounds rb);
	public ArrayList<Tourinfo> foodlist(String searchText, RowBounds rb);
	public ArrayList<Tourinfo> leisurelist(String searchText, RowBounds rb);
	public ArrayList<Tourinfo> explist(String searchText, RowBounds rb);

	//게시판 글읽기
	public Tourinfo readInfo(int info_num);
	//조회수 1증가
	public void addHits(int info_num);
	//땡기네 1증가
	public void addLike(int info_num);
	//글쓰기
	public int writeInfo(Tourinfo info);
	//글 수정
	public int updateInfo(Tourinfo info);
	//글번호로 글 찾기
	public Tourinfo getInfoByNum(int info_num);
	//글 삭제
	public int deleteInfo(Tourinfo info);
	//기존에 등록된 썸네일 삭제
	public int deleteFile(int info_num);
	// 땡기네 높은 순으로 찾기
	public ArrayList<Tourinfo> selectLikeList();
	//조회수 가장 높은 게시글
	public Tourinfo selectTopHits();
	
}
