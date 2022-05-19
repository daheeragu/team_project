package global.sesoc.busanonna_tour.vo.user;

public class Admin {
	
	private String admin_id;
	private String admin_password;
	private String admin_name;
	private String admin_email;
	
	
	public Admin() {
	}


	public Admin(String admin_id, String admin_password, String admin_name, String admin_email) {
		super();
		this.admin_id = admin_id;
		this.admin_password = admin_password;
		this.admin_name = admin_name;
		this.admin_email = admin_email;
	}


	public String getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}


	public String getAdmin_password() {
		return admin_password;
	}


	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}


	public String getAdmin_name() {
		return admin_name;
	}


	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}


	public String getAdmin_email() {
		return admin_email;
	}


	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}


	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_password=" + admin_password + ", admin_name=" + admin_name
				+ ", admin_email=" + admin_email + "]";
	}
	
}
