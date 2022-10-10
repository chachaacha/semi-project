package userVO;

import java.sql.Date;

public class MyCommVO {
	
	private int  comment_idx, reply_idx;
	private String contents, product_idx, title, deleted;
	private Date posted_date;
	
	public MyCommVO() {
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		return "MyCommVO [comment_idx=" + comment_idx + ", reply_idx=" + reply_idx + ", contents=" + contents
				+ ", product_idx=" + product_idx + ", title=" + title + ", deleted=" + deleted + ", posted_date="
				+ posted_date + "]";
	}

	

	
	
	
}
