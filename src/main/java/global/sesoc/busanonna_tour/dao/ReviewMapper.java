package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.busanonna_tour.vo.Reply;
import global.sesoc.busanonna_tour.vo.review.Review;

public interface ReviewMapper {
	
	//리뷰목록 출력
	ArrayList<Review> reviewList(String searchText, RowBounds rb);

	//리뷰 쓰기
	int writeReview(Review review);
	
	//리뷰 읽기
	Review readReview(int review_num);
	
	//리뷰 수정
	int updateReview(Review review);

	//리뷰 삭제	
	int deleteReview(Review review);

	//댓글 저장
	int insertReply(Reply reply);
	
	//댓글 목록 출력
	ArrayList<Reply> replyList(int review_num);
	
	//댓글 삭제
	int deleteReply(Reply reply);
	
	//글 개수 가져오기
	int getTotal(String searchText);

	//조회수 1 증가
	void addHits(int review_num);

	

}
