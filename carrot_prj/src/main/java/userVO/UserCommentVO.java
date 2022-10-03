package userVO;

import java.util.Date;

public class UserCommentVO {
	private int comment_idx, reply_idx, product_idx, reported_num;
	private String id, contents, new_contents, deleted, nick;
	private Date posted_date;
	
	public UserCommentVO() {

	}

	public UserCommentVO(int comment_idx, int reply_idx, int product_idx, int reported_num, String id, String contents,
			String new_contents, String deleted, String nick, Date posted_date) {
		super();
		this.comment_idx = comment_idx;
		this.reply_idx = reply_idx;
		this.product_idx = product_idx;
		this.reported_num = reported_num;
		this.id = id;
		this.contents = contents;
		this.new_contents = new_contents;
		this.deleted = deleted;
		this.nick = nick;
		this.posted_date = posted_date;
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

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getReported_num() {
		return reported_num;
	}

	public void setReported_num(int reported_num) {
		this.reported_num = reported_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getNew_contents() {
		return new_contents;
	}

	public void setNew_contents(String new_contents) {
		this.new_contents = new_contents;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Date getPosted_date() {
		return posted_date;
	}

	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}

	@Override
	public String toString() {
		return "CommentVO [comment_idx=" + comment_idx + ", reply_idx=" + reply_idx + ", product_idx=" + product_idx
				+ ", reported_num=" + reported_num + ", id=" + id + ", contents=" + contents + ", new_contents="
				+ new_contents + ", deleted=" + deleted + ", nick=" + nick + ", posted_date=" + posted_date + "]";
	}

	
}
