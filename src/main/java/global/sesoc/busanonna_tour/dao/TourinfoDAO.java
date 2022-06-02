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
import global.sesoc.busanonna_tour.vo.tourinfo.Tourinfo;

@Repository
public class TourinfoDAO {
	private static final Logger logger = LoggerFactory.getLogger(TourinfoDAO.class);

	@Autowired
	SqlSession sqlSession;
	
	//명소 글개수
	public int getTotalSpot(String searchText) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		int result = 0; 
		    
		result = mapper.getTotalSpot(searchText);
	    return result;
	}
	
	//먹거리 글개수
	public int getTotalFood(String searchText) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		int result = 0; 
		    
		result = mapper.getTotalFood(searchText);
	    return result;
	}
	
	//레저 글개수
	public int getTotalLeisure(String searchText) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		int result = 0; 
		    
		result = mapper.getTotalLeisure(searchText);
	    return result;
	}
	
	//체험 글개수
	public int getTotalExp(String searchText) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		int result = 0; 
		    
		result = mapper.getTotalExp(searchText);
	    return result;
	}
	
	//명소 글목록
	public ArrayList<Tourinfo> spotlist(String searchText, int startRecord, int countPerPage) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<Tourinfo> result = mapper.spotlist(searchText, rb);
		return result;
	}
	
	//먹거리 글목록
	public ArrayList<Tourinfo> foodlist(String searchText, int startRecord, int countPerPage) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<Tourinfo> result = mapper.foodlist(searchText, rb);
		return result;
	}
	
	//레저 글목록
		public ArrayList<Tourinfo> leisurelist(String searchText, int startRecord, int countPerPage) {
			TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
			
			//전체 검색 결과 중 읽을 시작위치와 개수
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			
			//검색어와 읽을 범위를 전달
			ArrayList<Tourinfo> result = mapper.leisurelist(searchText, rb);
			return result;
		}
		
		//체험 글목록
		public ArrayList<Tourinfo> explist(String searchText, int startRecord, int countPerPage) {
			TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
			
			//전체 검색 결과 중 읽을 시작위치와 개수
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			
			//검색어와 읽을 범위를 전달
			ArrayList<Tourinfo> result = mapper.explist(searchText, rb);
			return result;
		}

	//글 읽을 때 조회수 1 증가
	public void addHits(int info_num) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		//조회수 1증가(업데이트)
		mapper.addHits(info_num);
	}
		
	//게시판 글읽기
	public Tourinfo readInfo(int info_num) {
		 TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		 //해당 번호의 글정보 읽기
		 Tourinfo info = mapper.readInfo(info_num);
		 return info; 
	}
	
	//글쓰기
	public int writeInfo(Tourinfo info) {
	    TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
	    int result = mapper.writeInfo(info);
	    return result; 
	}
	
    //글 수정
	public int updateInfo(Tourinfo info) {
	    TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
	    int result = mapper.updateInfo(info);
	    return result; 
	}
	
	//글 수정 페이지에서 기존에 등록된 썸네일 삭제
	public int deleteFile(int info_num) {
		 TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		 int result = mapper.deleteFile(info_num);
		 return result;
	}
	
	//글번호로 글찾기
	public Tourinfo getInfoByNum(int info_num) {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		Tourinfo result = mapper.getInfoByNum(info_num);
		return result;
	}
	
	//글 삭제
	public int deleteInfo(Tourinfo info) {
	      TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
	       int result = 0; 
	       result = mapper.deleteInfo(info);
	       return result;     
	}
	
	//땡기네 1 증가
	public void addLike(int info_num) {
		 TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		 mapper.addLike(info_num);
	}
	
	// 떙기네 높은 순으로 찾아오기
	public ArrayList<Tourinfo> selectLikeList(){
		ArrayList<Tourinfo> likeList = new ArrayList<>();
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		
		likeList = mapper.selectLikeList();
		return likeList;
	}
	
	//조회수 최다 게시글
	public Tourinfo selectTopHits() {
		TourinfoMapper mapper = sqlSession.getMapper(TourinfoMapper.class);
		Tourinfo result = mapper.selectTopHits();
		return result;
	}

}
