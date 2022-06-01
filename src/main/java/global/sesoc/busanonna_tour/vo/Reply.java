package global.sesoc.busanonna_tour.vo;

public class Reply {

	private int reply_num; //댓글 번호
	private int review_num; //리뷰 글 번호
	private String reply_content;	//리플 내용
	private String user_id;  //작성자 아이디
	private String reply_inputdate; //작성일 
	
	public Reply() {	
	}

	public Reply(int reply_num, int review_num, String reply_content, String user_id, String reply_inputdate) {
		super();
		this.reply_num = reply_num;
		this.review_num = review_num;
		this.reply_content = reply_content;
		this.user_id = user_id;
		this.reply_inputdate = reply_inputdate;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReply_inputdate() {
		return reply_inputdate;
	}

	public void setReply_inputdate(String reply_inputdate) {
		this.reply_inputdate = reply_inputdate;
	}

	@Override
	public String toString() {
		return "Reply [reply_num=" + reply_num + ", review_num=" + review_num + ", reply_content=" + reply_content + ", user_id="
				+ user_id + ", reply_inputdate=" + reply_inputdate + "]";
	}
	
	
}
