package userVO;

import java.util.Date;

public class BoardVO {
	private String id, nick, gu, title,product_idx, category, contents;
	private int price, liked_cnt,  report_cnt;
	private Date post_date;
	
	public BoardVO() {

	}

	public BoardVO(String id, String nick, String gu, String title, String product_idx, String category,
			String contents, int price, int liked_cnt, int report_cnt, Date post_date) {
		this.id = id;
		this.nick = nick;
		this.gu = gu;
		this.title = title;
		this.product_idx = product_idx;
		this.category = category;
		this.contents = contents;
		this.price = price;
		this.liked_cnt = liked_cnt;
		this.report_cnt = report_cnt;
		this.post_date = post_date;
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

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", nick=" + nick + ", gu=" + gu + ", title=" + title + ", product_idx="
				+ product_idx + ", category=" + category + ", contents=" + contents + ", price=" + price
				+ ", liked_cnt=" + liked_cnt + ", report_cnt=" + report_cnt + ", post_date=" + post_date + "]";
	}

	
	
	
}
