package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.busanonna_tour.vo.Board;
import global.sesoc.busanonna_tour.vo.Reply;
import global.sesoc.busanonna_tour.vo.tourinfo.Tourinfo;

public interface TourinfoMapper {
    //글쓰기
	public int write(Tourinfo info);
	//글개수
	public int getTotalSpot(String theme);
	public int getTotalFood(String theme);
	public int getTotalLeisure(String theme);
	public int getTotalExp(String theme);
    //글목록
	public ArrayList<Tourinfo> spotlist(RowBounds rb);
	public ArrayList<Tourinfo> foodlist(RowBounds rb);
	public ArrayList<Tourinfo> leisurelist(RowBounds rb);
	public ArrayList<Tourinfo> explist(RowBounds rb);

	//게시판 글읽기
	public Tourinfo readInfo(int info_num);
	//조회수 1증가
	public void addHits(int tourinfo_num);
	//글 수정
	public int updateInfo(Tourinfo info);
	//글 삭제
	public int deleteInfo(Tourinfo info);
	
}