package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.busanonna_tour.vo.Notice;
import global.sesoc.busanonna_tour.vo.Notice_pic;

public interface NoticeMapper {

	//공지사항 목록
	public ArrayList<Notice> listNotice(String searchText, RowBounds rb);
	//홈화면용 공지사항 목록
	public ArrayList<Notice> listNoticeForHome();
	//공지사항 갯수
	public int getTotal(String searchText);
	//공지사항 읽기
	public Notice readNotice(int notice_num);
	//공지사항 넘버 미리 불러오기
	public int getNextNum(); 
	//공지사항 등록
	public int writeNotice(Notice notice);
	//공지사항 안의 파일 업로드
	public int insertFile(Notice_pic pic);
	//이미지 파일 하나씩 읽기
	public Notice_pic readFile(int noticepic_num);
	//이미지 파일 다 가져오기
	public ArrayList<Notice_pic> fileList (int notice_num);
	//공지사항 수정
	public int updateNotice(Notice notice);
	//파일 이미지 수정
	public int updateFile(int notice_num); 
	//공지사항 글 삭제
	public int deleteNotice(Notice notice);
}
