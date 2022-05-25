package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.busanonna_tour.vo.Event;
import global.sesoc.busanonna_tour.vo.Event_pic;
import global.sesoc.busanonna_tour.vo.Notice;

@Repository
public class EventDAO {

	private static final Logger logger = LoggerFactory.getLogger(EventDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	//이벤트 목록
	
	public ArrayList<Event> listEvent(String searchText, int startRecord, int countPerPage){
		
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
	    //전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위 전달
		ArrayList<Event> result = mapper.listEvent(searchText, rb);
		
		return result; 
	}
	//이벤트 번호 미리 불러오기
	public int getNextNum() {
		
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		int result = mapper.getNextNum();
		
		return result; 
	}
	
	//이벤트 등록
	public int writeEvent(Event event) {
		
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		int result = mapper.writeEvent(event);
		
		return result; 
	}
	
	//파일 업로드
	public int insertFile(Event_pic pic) {
		
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		int result = mapper.insertFile(pic);
		
		return result;
	}
	
	//파일 이미지 다 불러오기
	public ArrayList<Event_pic> fileList(int event_num) {
		
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		ArrayList<Event_pic> result = mapper.fileList(event_num);
		
		return result; 
	}
	
	// 파일 이미지 하나만 불러오기
	public Event_pic readFile(int eventpic_num) {

		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		Event_pic result = mapper.readFile(eventpic_num);

		return result;

	}
	
	//이벤트 읽기
	public Event readEvent(int event_num) {
		
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		Event result = mapper.readEvent(event_num);
		
		return result;
	}
	
	 //이벤트 수정
    public int updateEvent(Event event) {
    
    	EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		int result = mapper.updateEvent(event);
		
		return result; 
    }
    
    //이미지 파일 수정
    public int updateFile(int event_num) {
    	
    	EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		int result = mapper.updateFile(event_num);
		
		return result; 
    }
    //이벤트 삭제
    public int deleteEvent(Event event) {
    	
    	EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		int result = mapper.deleteEvent(event);
		
		return result; 
    	
    }
    
    //총 이벤트 건수
    public int getTotal(String searchText) {
    	
    	EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		int result = mapper.getTotal(searchText);
		
		return result; 
    }
  
    // 업로드 이미지 중 첫번째 사진만 빼서 오기 
    public ArrayList<Event_pic> selectFile() {

    	EventMapper mapper = sqlSession.getMapper(EventMapper.class);
    	ArrayList<Event_pic> result = mapper.selectFile();
		
		return result; 
    }
    
    //수정폼에서 기존의 파일 삭제
    public int deleteFile(int eventpic_num) {
    	
    	EventMapper mapper = sqlSession.getMapper(EventMapper.class);
        int result = mapper.deleteFile(eventpic_num);
		
		return result; 
    	
  
    	
    }
}
