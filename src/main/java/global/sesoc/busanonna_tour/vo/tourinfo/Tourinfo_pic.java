package global.sesoc.busanonna_tour.vo.tourinfo;

public class Tourinfo_pic {
	private int infopic_num;	//정보글 사진 고유번호
	private String savedfile;	//서버에 저장되는 정보글 이미지 파일
	private int info_num;		//정보글 번호
	
	public Tourinfo_pic() {
	}

	public Tourinfo_pic(int infopic_num, String savedfile, int info_num) {
		super();
		this.infopic_num = infopic_num;
		this.savedfile = savedfile;
		this.info_num = info_num;
	}

	public int getInfopic_num() {
		return infopic_num;
	}

	public void setInfopic_num(int infopic_num) {
		this.infopic_num = infopic_num;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public int getInfo_num() {
		return info_num;
	}

	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}

	@Override
	public String toString() {
		return "Tourinfo_pic [infopic_num=" + infopic_num + ", savedfile=" + savedfile + ", info_num=" + info_num + "]";
	}
	
}
