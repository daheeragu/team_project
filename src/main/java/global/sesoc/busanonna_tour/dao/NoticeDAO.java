package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.busanonna_tour.vo.Notice;
import global.sesoc.busanonna_tour.vo.Notice_pic;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 공지사항 목록
	public ArrayList<Notice> listNotice(String searchText, int startRecord, int countPerPage){
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		
		//전체 검색 결과 중 읽을 시작위치와 갯수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		//검색어와 읽을 범위를 전달
		ArrayList<Notice> result = mapper.listNotice(searchText, rb);
		
		return result; 
	}
	// 공지사항 갯수
	public int getTotal(String searchText) {
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.getTotal(searchText);
		
		return result; 
	}
	
	//공지사항 읽기
	public Notice readNotice(int notice_num) {
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		Notice result = mapper.readNotice(notice_num);
		
		return result; 
	}
	
	//공지사항 번호 미리 불러오기
	public int getNextNum() {
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.getNextNum();
		
		return result; 
	}
	
	//공지사항 등록
	public int writeNotice(Notice notice) {
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.writeNotice(notice);
		
		return result;
	}
    //공지사항 등록안의 파일 업로드
	public int insertFile(Notice_pic pic) {

		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.insertFile(pic);
		
		return result;
				
	}
	
	//이미지 파일 하나씩 읽기
	public Notice_pic readFile(int noticepic_num) {
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		Notice_pic result = mapper.readFile(noticepic_num);
	
		return result;
		
	}
	
	//공지사항에 해당하는 이미지 파일 다 불러오기
	public ArrayList<Notice_pic> fileList (int notice_num){
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		ArrayList<Notice_pic> result = mapper.fileList(notice_num);
		
		return result; 
	}
	
	//공지사항 수정
	public int updateNotice(Notice notice) {
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.updateNotice(notice);
		
		return result;
	}
	
	//파일 이미지 수정
	public int updateFile(int notice_num) {
		
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.updateFile(notice_num);
		
		return result; 
	}
	
	//공지사항 삭제
	public int deleteNotice(Notice notice) {
		
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.deleteNotice(notice);
		
		return result;
	}
}
