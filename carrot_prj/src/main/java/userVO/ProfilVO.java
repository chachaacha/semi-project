package userVO;

public class ProfilVO {
	private String id, nick, img;
	private int reported_cnt;
	
	public ProfilVO() {
		
	}

	public ProfilVO(String id, String nick, String img, int reported_cnt) {
		super();
		this.id = id;
		this.nick = nick;
		this.img = img;
		this.reported_cnt = reported_cnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getReported_cnt() {
		return reported_cnt;
	}

	public void setReported_cnt(int reported_cnt) {
		this.reported_cnt = reported_cnt;
	}

	@Override
	public String toString() {
		return "ProfilVO [id=" + id + ", nick=" + nick + ", img=" + img + ", reported_cnt=" + reported_cnt + "]";
	}

	
}
