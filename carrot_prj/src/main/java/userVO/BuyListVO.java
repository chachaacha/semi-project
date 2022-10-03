package userVO;

import java.sql.Date;

public class BuyListVO {
	private String buy_id, thumbnail, title, gu, sold_chk;
	private Date post_date;
	private int comment_cnt, like_cnt, product_idx, price;
	
	public BuyListVO() {
	}

	public BuyListVO(String buy_id, String thumbnail, String title, String gu, String sold_chk, Date post_date,
			int comment_cnt, int like_cnt, int product_idx, int price) {
		super();
		this.buy_id = buy_id;
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.sold_chk = sold_chk;
		this.post_date = post_date;
		this.comment_cnt = comment_cnt;
		this.like_cnt = like_cnt;
		this.product_idx = product_idx;
		this.price = price;
	}

	public String getBuy_id() {
		return buy_id;
	}

	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getSold_chk() {
		return sold_chk;
	}

	public void setSold_chk(String sold_chk) {
		this.sold_chk = sold_chk;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	public int getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BuyListVO [buy_id=" + buy_id + ", thumbnail=" + thumbnail + ", title=" + title + ", gu=" + gu
				+ ", sold_chk=" + sold_chk + ", post_date=" + post_date + ", comment_cnt=" + comment_cnt + ", like_cnt="
				+ like_cnt + ", product_idx=" + product_idx + ", price=" + price + "]";
	}
	
}
