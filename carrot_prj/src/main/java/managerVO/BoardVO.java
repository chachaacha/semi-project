package managerVO;

import java.util.Date;

public class BoardVO {
	private String img, id, nick, gu, title, category, contents, free, sold_check, tumbnail, reserved;
	private int price, liked_cnt, report_cnt, comment_cnt;
	private Date posted_date;
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFree() {
		return free;
	}

	public void setFree(String free) {
		this.free = free;
	}

	public String getSold_check() {
		return sold_check;
	}

	public void setSold_check(String sold_check) {
		this.sold_check = sold_check;
	}

	public String getTumbnail() {
		return tumbnail;
	}

	public void setTumbnail(String tumbnail) {
		this.tumbnail = tumbnail;
	}

	public String getReserved() {
		return reserved;
	}

	public void setReserved(String reserved) {
		this.reserved = reserved;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getLiked_cnt() {
		return liked_cnt;
	}

	public void setLiked_cnt(int liked_cnt) {
		this.liked_cnt = liked_cnt;
	}

	public int getReport_cnt() {
		return report_cnt;
	}

	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}
	

	public int getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public Date getPosted_date() {
		return posted_date;
	}

	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}

	@Override
	public String toString() {
		return "BoardVO [img=" + img + ", id=" + id + ", nick=" + nick + ", gu=" + gu + ", title=" + title
				+ ", category=" + category + ", contents=" + contents + ", free=" + free + ", sold_check=" + sold_check
				+ ", tumbnail=" + tumbnail + ", reserved=" + reserved + ", price=" + price + ", liked_cnt=" + liked_cnt
				+ ", report_cnt=" + report_cnt + ", comment_cnt=" + comment_cnt + ", posted_date=" + posted_date + "]";
	}
	
}
