package global.sesoc.busanonna_tour.vo;

public class Event {
	private int event_num;	//이벤트글 고유번호
	private String admin_id;	//작성자 아이디
	private String event_title;	//이벤트글 제목
	private String event_content;	//이벤트 내용
	private int event_hits;	//이벤트글 조회수
	private String event_startdate;	//이벤트 시작일
	private String event_enddate;	//이벤트 종료일
	private String event_inputdate;	//이벤트글 작성일
	private String event_savedfile;	//이벤트글에 첨부된 이미지 파일
	private String event_state;	//이벤트 진행상황
	
	public Event() {
	}

	public Event(int event_num, String admin_id, String event_title, String event_content, int event_hits,
			String event_startdate, String event_enddate, String event_inputdate, String event_savedfile,
			String event_state) {
		super();
		this.event_num = event_num;
		this.admin_id = admin_id;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_hits = event_hits;
		this.event_startdate = event_startdate;
		this.event_enddate = event_enddate;
		this.event_inputdate = event_inputdate;
		this.event_savedfile = event_savedfile;
		this.event_state = event_state;
	}

	public int getEvent_num() {
		return event_num;
	}

	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public int getEvent_hits() {
		return event_hits;
	}

	public void setEvent_hits(int event_hits) {
		this.event_hits = event_hits;
	}

	public String getEvent_startdate() {
		return event_startdate;
	}

	public void setEvent_startdate(String event_startdate) {
		this.event_startdate = event_startdate;
	}

	public String getEvent_enddate() {
		return event_enddate;
	}

	public void setEvent_enddate(String event_enddate) {
		this.event_enddate = event_enddate;
	}

	public String getEvent_inputdate() {
		return event_inputdate;
	}

	public void setEvent_inputdate(String event_inputdate) {
		this.event_inputdate = event_inputdate;
	}

	public String getEvent_savedfile() {
		return event_savedfile;
	}

	public void setEvent_savedfile(String event_savedfile) {
		this.event_savedfile = event_savedfile;
	}

	public String getEvent_state() {
		return event_state;
	}

	public void setEvent_state(String event_state) {
		this.event_state = event_state;
	}

	@Override
	public String toString() {
		return "Event [event_num=" + event_num + ", admin_id=" + admin_id + ", event_title=" + event_title
				+ ", event_content=" + event_content + ", event_hits=" + event_hits + ", event_startdate="
				+ event_startdate + ", event_enddate=" + event_enddate + ", event_inputdate=" + event_inputdate
				+ ", event_savedfile=" + event_savedfile + ", event_state=" + event_state + "]";
	}
	
}
