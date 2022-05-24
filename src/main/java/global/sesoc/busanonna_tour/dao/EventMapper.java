package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.busanonna_tour.vo.Event;
import global.sesoc.busanonna_tour.vo.Event_pic;


public interface EventMapper {

	//이벤트 목록
    public ArrayList<Event> listEvent(String searchText, RowBounds rb);
	//이벤트 번호 미리 불러오기
	public int getNextNum();
	//이벤트 등록
	public int writeEvent(Event event);
	//파일 업로드 
	public int insertFile(Event_pic pic);
	//파일 다 가져오기
    public ArrayList<Event_pic> fileList(int event_num);
    //이미지 파일 하나 가져오기
    public Event_pic readFile(int eventpic_num);
    //이벤트 읽기
    public Event readEvent(int event_num);
    //이벤트 수정
    public int updateEvent(Event event);
    //이미지 파일 수정
    public int updateFile(int event_num);
    //이벤트 삭제
    public int deleteEvent(Event event);
    //이벤트 글 개수
    public int getTotal(String searchText);
    // 업로드 이미지 중 첫번째 사진만 빼서 오기 
    public ArrayList<Event_pic> selectFile();
    //수정 폼 기존 파일 삭제
    public int deleteFile(int eventpic_num);
}
