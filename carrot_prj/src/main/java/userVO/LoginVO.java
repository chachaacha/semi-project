package userVO;

public class LoginVO {
	private String id, password;
	
	public LoginVO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public LoginVO(String id, String password, String deleted, String blocked_reason) {
		this.id = id;
		this.password = password;
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

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + ", blocked_reason=" + "]";
	}
	
	
	
}
