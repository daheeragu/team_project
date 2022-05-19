package global.sesoc.busanonna_tour.vo;

public class Reply {

	private int reply_num; //댓글 번호
	private int review_num; //리뷰 글 번호
	private String content;	//리플 내용
	private String user_id;  //작성자 아이디
	private String inputdate; //작성일 
	
	public Reply() {	
	}

	public Reply(int reply_num, int review_num, String content, String user_id, String inputdate) {
		super();
		this.reply_num = reply_num;
		this.review_num = review_num;
		this.content = content;
		this.user_id = user_id;
		this.inputdate = inputdate;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "Reply [reply_num=" + reply_num + ", review_num=" + review_num + ", content=" + content + ", user_id="
				+ user_id + ", inputdate=" + inputdate + "]";
	}
	
	
}
