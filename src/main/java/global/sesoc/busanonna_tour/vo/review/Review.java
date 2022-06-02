package global.sesoc.busanonna_tour.vo.review;

public class Review {
	private String user_id;	//작성자 아이디
	private int info_num;	//리뷰와 관련된 여행지 번호
	private String info_name; //리뷰와 관련된 여행지 이름
	private int review_num;	//리뷰글 고유번호
	private String review_title;	//리뷰 제목
	private String review_content;	//리뷰 내용
	private String review_inputdate;	//리뷰 작성일
	private int review_like;	//리뷰 좋아요
	private int review_hits;	//리뷰 조회수
	
	public Review() {
	}

	

	
	public Review(String user_id, int info_num, String info_name, int review_num, String review_title,
			String review_content, String review_inputdate, int review_like, int review_hits) {
		super();
		this.user_id = user_id;
		this.info_num = info_num;
		this.info_name = info_name;
		this.review_num = review_num;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_inputdate = review_inputdate;
		this.review_like = review_like;
		this.review_hits = review_hits;
	}




	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getInfo_num() {
		return info_num;
	}

	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_inputdate() {
		return review_inputdate;
	}

	public void setReview_inputdate(String review_inputdate) {
		this.review_inputdate = review_inputdate;
	}

	public int getReview_like() {
		return review_like;
	}

	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}

	public int getReview_hits() {
		return review_hits;
	}

	public void setReview_hits(int review_hits) {
		this.review_hits = review_hits;
	}

	@Override
	public String toString() {
		return "Review [user_id=" + user_id + ", info_num=" + info_num + ", review_num=" + review_num
				+ ", review_title=" + review_title + ", review_content=" + review_content + ", review_inputdate="
				+ review_inputdate + ", review_like=" + review_like + ", review_hits=" + review_hits + "]";
	}

}
