package day1010;

public class PwUpVO {
	private String id, password, new_pw;
	
	public PwUpVO() {
	}

	public PwUpVO(String id, String password, String new_pw) {
		super();
		this.id = id;
		this.password = password;
		this.new_pw = new_pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNew_pw() {
		return new_pw;
	}

	public void setNew_pw(String new_pw) {
		this.new_pw = new_pw;
	}

	@Override
	public String toString() {
		return "PwUpVO [id=" + id + ", password=" + password + ", new_pw=" + new_pw + "]";
	}
	
}
