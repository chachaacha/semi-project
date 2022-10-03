package userVO;

public class ReportBVO {
	private String id, nick;
	private int product_idx, rr_idx;
	
	public ReportBVO() {

	}

	public ReportBVO(String id, String nick, int product_idx, int rr_idx) {
		super();
		this.id = id;
		this.nick = nick;
		this.product_idx = product_idx;
		this.rr_idx = rr_idx;
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

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getRr_idx() {
		return rr_idx;
	}

	public void setRr_idx(int rr_idx) {
		this.rr_idx = rr_idx;
	}

	@Override
	public String toString() {
		return "ReportBVO [id=" + id + ", nick=" + nick + ", product_idx=" + product_idx + ", rr_idx=" + rr_idx + "]";
	}

}
