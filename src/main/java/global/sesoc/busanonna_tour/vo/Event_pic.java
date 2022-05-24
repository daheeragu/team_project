package global.sesoc.busanonna_tour.vo;

public class Event_pic {
    private int eventpic_num; //이벤트 이미지 고유번호
    private String savedfile; 
	private int event_num;	//이벤트글 고유번호
	
	public Event_pic() {
		
	}

	public Event_pic(int eventpic_num, String savedfile, int event_num) {
		this.eventpic_num = eventpic_num;
		this.savedfile = savedfile;
		this.event_num = event_num;
	}

	public int getEventpic_num() {
		return eventpic_num;
	}

	public void setEventpic_num(int eventpic_num) {
		this.eventpic_num = eventpic_num;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public int getEvent_num() {
		return event_num;
	}

	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}

	@Override
	public String toString() {
		return "Event_pic [eventpic_num=" + eventpic_num + ", savedfile=" + savedfile + ", event_num=" + event_num
				+ "]";
	}
	
	
	
	
	
	
}
