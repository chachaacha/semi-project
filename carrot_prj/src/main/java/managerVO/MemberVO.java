package managerVO;

import java.util.Date;

public class MemberVO {
	private String id, name, birth;
	private Date joined_date, quit_date;
	
	public MemberVO() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Date getJoined_date() {
		return joined_date;
	}

	public void setJoined_date(Date joined_date) {
		this.joined_date = joined_date;
	}

	public Date getQuit_date() {
		return quit_date;
	}

	public void setQuit_date(Date quit_date) {
		this.quit_date = quit_date;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", birth=" + birth + ", joined_date=" + joined_date
				+ ", quit_date=" + quit_date + "]";
	}

	
	
}
