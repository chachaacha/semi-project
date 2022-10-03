package userVO;

/**
 * 비번찾기VO
 * @author user
 *
 */
public class FindPwVO {
	private String name, id, phone_num, temp;
	
	public FindPwVO() {
		// TODO Auto-generated constructor stub
	}

	public FindPwVO(String name, String id, String phone_num, String temp) {
		this.name = name;
		this.id = id;
		this.phone_num = phone_num;
		this.temp = temp;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	@Override
	public String toString() {
		return "FindPwVO [name=" + name + ", id=" + id + ", phone_num=" + phone_num + ", temp=" + temp + "]";
	}
}
