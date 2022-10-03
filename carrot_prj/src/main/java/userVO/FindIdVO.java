package userVO;

public class FindIdVO {
	private String name, birth, phone_num;
	
	public FindIdVO() {
		// TODO Auto-generated constructor stub
	}

	public FindIdVO(String name, String birth, String phone_num) {
		super();
		this.name = name;
		this.birth = birth;
		this.phone_num = phone_num;
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

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	@Override
	public String toString() {
		return "FIndIdVO [name=" + name + ", birth=" + birth + ", phone_num=" + phone_num + "]";
	}
}
