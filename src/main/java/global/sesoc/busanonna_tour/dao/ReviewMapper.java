package global.sesoc.busanonna_tour.dao;

import java.util.ArrayList;

import global.sesoc.busanonna_tour.vo.review.Review;

public interface ReviewMapper {

	ArrayList<Review> reviewList();

	int writeReview(Review review);

	Review readReview(int review_num);

}