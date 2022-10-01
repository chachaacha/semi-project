package day1010;

import java.sql.Date;

public class QuitVO {
	private String id, password, quit;
	private Date quit_date;
	
	public QuitVO() {
	}
	
	public QuitVO(String id, String password, String quit, Date quit_date) {
		super();
		this.id = id;
		this.password = password;
		this.quit = quit;
		this.quit_date = quit_date;
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

	public String getQuit() {
		return quit;
	}

	public void setQuit(String quit) {
		this.quit = quit;
	}

	public Date getQuit_date() {
		return quit_date;
	}

	public void setQuit_date(Date quit_date) {
		this.quit_date = quit_date;
	}

	@Override
	public String toString() {
		return "QuitVO [id=" + id + ", password=" + password + ", quit=" + quit + ", quit_date=" + quit_date + "]";
	}
	
}
