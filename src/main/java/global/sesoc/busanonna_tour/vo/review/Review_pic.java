package global.sesoc.busanonna_tour.vo.review;

public class Review_pic {
	private int reviewpic_num;	//리뷰 이미지 파일 고유번호
	private String savedfile;	//서버에 저장되는 이미지 파일
	private int review_num;		//리뷰글 번호
	
	public Review_pic() {
	}

	public Review_pic(int reviewpic_num, String savedfile, int review_num) {
		super();
		this.reviewpic_num = reviewpic_num;
		this.savedfile = savedfile;
		this.review_num = review_num;
	}

	public int getReviewpic_num() {
		return reviewpic_num;
	}

	public void setReviewpic_num(int reviewpic_num) {
		this.reviewpic_num = reviewpic_num;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	@Override
	public String toString() {
		return "Review_pic [reviewpic_num=" + reviewpic_num + ", savedfile=" + savedfile + ", review_num=" + review_num
				+ "]";
	}
	
	
}
