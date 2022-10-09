package managerVO;

import java.util.Date;

public class MangerCommentVO {
	private String idPlusNick, id, contents, img; 
	private int comment_idx, reply_idx, reported_cnt;
	private Date posted_date;
	public String getIdPlusNick() {
		return idPlusNick;
	}
	public void setIdPlusNick(String idPlusNick) {
		this.idPlusNick = idPlusNick;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public int getReported_cnt() {
		return reported_cnt;
	}
	public void setReported_cnt(int reported_cnt) {
		this.reported_cnt = reported_cnt;
	}
	public Date getPosted_date() {
		return posted_date;
	}
	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}
	
	@Override
	public String toString() {
		return "MangerCommentVO [idPlusNick=" + idPlusNick + ", id=" + id + ", contents=" + contents + ", img=" + img
				+ ", comment_idx=" + comment_idx + ", reply_idx=" + reply_idx + ", reported_cnt=" + reported_cnt
				+ ", posted_date=" + posted_date + "]";
	}
	

	
	
}
