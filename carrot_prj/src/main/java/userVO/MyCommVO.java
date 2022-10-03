package userVO;

import java.sql.Date;

public class MyCommVO {
	
	private int product_idx, comment_idx, reply_idx;
	private String id, contents, title, re_contents, deleted;
	private Date posted_date;
	
	public MyCommVO() {
	}

	public MyCommVO(int product_idx, int comment_idx, int reply_idx, String id, String contents, String title,
			String re_contents, String deleted, Date posted_date) {
		super();
		this.product_idx = product_idx;
		this.comment_idx = comment_idx;
		this.reply_idx = reply_idx;
		this.id = id;
		this.contents = contents;
		this.title = title;
		this.re_contents = re_contents;
		this.deleted = deleted;
		this.posted_date = posted_date;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRe_contents() {
		return re_contents;
	}

	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public Date getPosted_date() {
		return posted_date;
	}

	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}

	@Override
	public String toString() {
		return "MyCommVO [product_idx=" + product_idx + ", comment_idx=" + comment_idx + ", reply_idx=" + reply_idx
				+ ", id=" + id + ", contents=" + contents + ", title=" + title + ", re_contents=" + re_contents
				+ ", deleted=" + deleted + ", posted_date=" + posted_date + "]";
	}
	
}
