package userVO;

public class JoinVO {
	private String img, name, nick,id, password, birth, phone_num, sms_chk, email, email_chk, zipcode, addr1,addr2;
	
	public JoinVO() {
		// TODO Auto-generated constructor stub
	}

	public JoinVO(String img, String name, String nick, String id, String password, String birth, String phone_num,
			String sms_chk, String email, String email_chk, String zipcode, String addr1, String addr2) {
		this.img = img;
		this.name = name;
		this.nick = nick;
		this.id = id;
		this.password = password;
		this.birth = birth;
		this.phone_num = phone_num;
		this.sms_chk = sms_chk;
		this.email = email;
		this.email_chk = email_chk;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
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

	public String getSms_chk() {
		return sms_chk;
	}

	public void setSms_chk(String sms_chk) {
		this.sms_chk = sms_chk;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail_chk() {
		return email_chk;
	}

	public void setEmail_chk(String email_chk) {
		this.email_chk = email_chk;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	@Override
	public String toString() {
		return "JoinVO [img=" + img + ", name=" + name + ", nick=" + nick + ", id=" + id + ", password=" + password
				+ ", birth=" + birth + ", phone_num=" + phone_num + ", sms_chk=" + sms_chk + ", email=" + email
				+ ", email_chk=" + email_chk + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + "]";
	}
	
	
	
	
	
	
	
}
