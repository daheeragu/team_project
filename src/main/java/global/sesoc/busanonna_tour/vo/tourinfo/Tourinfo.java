package global.sesoc.busanonna_tour.vo.tourinfo;

import java.util.ArrayList;

public class Tourinfo {
	private int info_num;	//정보글 고유번호
	private String admin_id;	//관리자 아이디
	private String info_title;	//정보글 제목
	private String info_subtitle;	//정보글 부제목
	private String info_content;	//정보글 내용
	private String info_inputdate;	//정보글 작성일
	private int info_hits;	//정보글 조회수
	private int info_like;	//여행지 땡기네 
	private String info_address;	//여행지 상세주소
	private String info_name;	//여행지 이름
	private String info_state;	//여행지 이용상태(이용가능/이용불가)
	private String info_gu;	//여행지 행정구역
	private String info_theme;	//여행지 테마
	private String savedfile;	//썸네일 저장된 이름
	
	
	public Tourinfo() {
	}

	public Tourinfo(int info_num, String admin_id, String info_title, String info_subtitle, String info_content,
			String info_inputdate, int info_hits, int info_like, String info_address, String info_name,
			String info_state, String info_gu, String info_theme, String savedfile) {
		super();
		this.info_num = info_num;
		this.admin_id = admin_id;
		this.info_title = info_title;
		this.info_subtitle = info_subtitle;
		this.info_content = info_content;
		this.info_inputdate = info_inputdate;
		this.info_hits = info_hits;
		this.info_like = info_like;
		this.info_address = info_address;
		this.info_name = info_name;
		this.info_state = info_state;
		this.info_gu = info_gu;
		this.info_theme = info_theme;
		this.savedfile = savedfile;
	}

	public int getInfo_num() {
		return info_num;
	}

	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

	public String getInfo_subtitle() {
		return info_subtitle;
	}

	public void setInfo_subtitle(String info_subtitle) {
		this.info_subtitle = info_subtitle;
	}

	public String getInfo_content() {
		return info_content;
	}

	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}

	public String getInfo_inputdate() {
		return info_inputdate;
	}

	public void setInfo_inputdate(String info_inputdate) {
		this.info_inputdate = info_inputdate;
	}

	public int getInfo_hits() {
		return info_hits;
	}

	public void setInfo_hits(int info_hits) {
		this.info_hits = info_hits;
	}

	public int getInfo_like() {
		return info_like;
	}

	public void setInfo_like(int info_like) {
		this.info_like = info_like;
	}

	public String getInfo_address() {
		return info_address;
	}

	public void setInfo_address(String info_address) {
		this.info_address = info_address;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getInfo_state() {
		return info_state;
	}

	public void setInfo_state(String info_state) {
		this.info_state = info_state;
	}

	public String getInfo_gu() {
		return info_gu;
	}

	public void setInfo_gu(String info_gu) {
		this.info_gu = info_gu;
	}

	public String getInfo_theme() {
		return info_theme;
	}

	public void setInfo_theme(String info_theme) {
		this.info_theme = info_theme;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	@Override
	public String toString() {
		return "Tourinfo [info_num=" + info_num + ", admin_id=" + admin_id + ", info_title=" + info_title
				+ ", info_subtitle=" + info_subtitle + ", info_content=" + info_content + ", info_inputdate="
				+ info_inputdate + ", info_hits=" + info_hits + ", info_like=" + info_like + ", info_address="
				+ info_address + ", info_name=" + info_name + ", info_state=" + info_state + ", info_gu=" + info_gu
				+ ", info_theme=" + info_theme + ", savedfile=" + savedfile +"]";
	}

}
