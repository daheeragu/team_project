package global.sesoc.busanonna_tour.vo.user;

public class Userinfo {
	
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	
	
	public Userinfo() {
	}


	public Userinfo(String user_id, String user_password, String user_name, String user_email) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_email = user_email;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_password() {
		return user_password;
	}


	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	@Override
	public String toString() {
		return "Userinfo [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_email=" + user_email + "]";
	}

}
