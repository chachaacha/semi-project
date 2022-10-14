package userVO;

public class ReportCVO {
	private String id, nick, product_idx;
	private int comment_idx, reply_idx, rr_idx;
	
	public ReportCVO() {

	}

	public ReportCVO(String id, String nick, String product_idx, int comment_idx, int reply_idx, int rr_idx) {
		super();
		this.id = id;
		this.nick = nick;
		this.product_idx = product_idx;
		this.comment_idx = comment_idx;
		this.reply_idx = reply_idx;
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

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public int getReply_idx() {
		return reply_idx;
	}

	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}

	public int getRr_idx() {
		return rr_idx;
	}

	public void setRr_idx(int rr_idx) {
		this.rr_idx = rr_idx;
	}

	@Override
	public String toString() {
		return "ReportCVO [id=" + id + ", nick=" + nick + ", product_idx=" + product_idx + ", comment_idx="
				+ comment_idx + ", reply_idx=" + reply_idx + ", rr_idx=" + rr_idx + "]";
	}

	
}
