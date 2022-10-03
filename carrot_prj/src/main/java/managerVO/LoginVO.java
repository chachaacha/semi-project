package managerVO;

public class LoginVO {
	private String manager_id, password, newPw;
	
	public LoginVO() {

	}

	public LoginVO(String manager_id, String password, String newPw) {
		super();
		this.manager_id = manager_id;
		this.password = password;
		this.newPw = newPw;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPw() {
		return newPw;
	}

	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}

	@Override
	public String toString() {
		return "LoginVO [manager_id=" + manager_id + ", password=" + password + ", newPw=" + newPw + "]";
	}
	  

}
