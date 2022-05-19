package global.sesoc.busanonna_tour.vo;

public class Notice {
	private String admin_id;	//작성한 관리자 아이디
	private int notice_num;		//공지사항 고유번호
	private String notice_title;	//공지사항 제목
	private String notice_content;	//공지사항 내용
	private String notice_inputdate;	//공지사항 작성일
	
	public Notice() {
	}

	public Notice(String admin_id, int notice_num, String notice_title, String notice_content,
			String notice_inputdate) {
		super();
		this.admin_id = admin_id;
		this.notice_num = notice_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_inputdate = notice_inputdate;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_inputdate() {
		return notice_inputdate;
	}

	public void setNotice_inputdate(String notice_inputdate) {
		this.notice_inputdate = notice_inputdate;
	}

	@Override
	public String toString() {
		return "Notice [admin_id=" + admin_id + ", notice_num=" + notice_num + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_inputdate=" + notice_inputdate + "]";
	}
	
	
}
