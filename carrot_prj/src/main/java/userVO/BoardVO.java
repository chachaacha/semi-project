package userVO;

import java.util.Date;

public class BoardVO {
	private String id, nick, gu, title, product_idx, category, contents, img, reserved, sold_check;
	private int price, liked_cnt,  report_cnt;
	private Date posted_date;
	
	public BoardVO() {

	}

	public BoardVO(String id, String nick, String gu, String title, String product_idx, String category,
			String contents, String img, String reserved, String sold_check, int price, int liked_cnt, int report_cnt,
			Date posted_date) {
		super();
		this.id = id;
		this.nick = nick;
		this.gu = gu;
		this.title = title;
		this.product_idx = product_idx;
		this.category = category;
		this.contents = contents;
		this.img = img;
		this.reserved = reserved;
		this.sold_check = sold_check;
		this.price = price;
		this.liked_cnt = liked_cnt;
		this.report_cnt = report_cnt;
		this.posted_date = posted_date;
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

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getReserved() {
		return reserved;
	}

	public void setReserved(String reserved) {
		this.reserved = reserved;
	}

	public String getSold_check() {
		return sold_check;
	}

	public void setSold_check(String sold_check) {
		this.sold_check = sold_check;
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

	public Date getPosted_date() {
		return posted_date;
	}

	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}

	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", nick=" + nick + ", gu=" + gu + ", title=" + title + ", product_idx="
				+ product_idx + ", category=" + category + ", contents=" + contents + ", img=" + img + ", reserved="
				+ reserved + ", sold_check=" + sold_check + ", price=" + price + ", liked_cnt=" + liked_cnt
				+ ", report_cnt=" + report_cnt + ", posted_date=" + posted_date + "]";
	}
	
}