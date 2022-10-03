package managerVO;

import java.util.Date;

public class MemberVO {
	private String id, name, birth;
	private Date joined_date;
	
	public MemberVO() {

	}

	public MemberVO(String id, String name, String birth, Date joined_date) {
		super();
		this.id = id;
		this.name = name;
		this.birth = birth;
		this.joined_date = joined_date;
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

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", birth=" + birth + ", joined_date=" + joined_date + "]";
	}
	
}
