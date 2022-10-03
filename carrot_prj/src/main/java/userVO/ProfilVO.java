package userVO;

public class ProfilVO {
	private String id, nick, img;
	private int report_cnt;
	
	public ProfilVO() {
	}

	public ProfilVO(String id, String nick, String img, int report_cnt) {
		super();
		this.id = id;
		this.nick = nick;
		this.img = img;
		this.report_cnt = report_cnt;
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

	public int getReport_cnt() {
		return report_cnt;
	}

	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}

	@Override
	public String toString() {
		return "ProfilVO [id=" + id + ", nick=" + nick + ", img=" + img + ", report_cnt=" + report_cnt + "]";
	}
	
}
