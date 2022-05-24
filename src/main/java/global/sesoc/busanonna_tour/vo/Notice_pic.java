package global.sesoc.busanonna_tour.vo;

public class Notice_pic {
	private int noticepic_num;	//공지사항 이미지 파일 고유번호
	private String savedfile;	//서버에 저장되는 이미지 파일
	private int notice_num;
	
	public Notice_pic() {
		
	}

	public Notice_pic(int noticepic_num, String savedfile, int notice_num) {
		this.noticepic_num = noticepic_num;
		this.savedfile = savedfile;
		this.notice_num = notice_num;
	}

	public int getNoticepic_num() {
		return noticepic_num;
	}

	public void setNoticepic_num(int noticepic_num) {
		this.noticepic_num = noticepic_num;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	@Override
	public String toString() {
		return "Notice_pic [noticepic_num=" + noticepic_num + ", savedfile=" + savedfile + ", notice_num=" + notice_num
				+ "]";
	}	
	
	
	
	
	
	
}
