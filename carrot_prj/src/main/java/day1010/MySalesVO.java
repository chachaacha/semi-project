package day1010;

import java.sql.Date;

public class MySalesVO {
	private String id, thumbnail, title, gu, reserv, sold_chk;
	private Date post_date;
	private int comment_cnt, like_cnt, product_idx, price;
	
	public MySalesVO() {
	}

	public MySalesVO(String id, String thumbnail, String title, String gu, String reserv, String sold_chk,
			Date post_date, int comment_cnt, int like_cnt, int product_idx, int price) {
		super();
		this.id = id;
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.reserv = reserv;
		this.sold_chk = sold_chk;
		this.post_date = post_date;
		this.comment_cnt = comment_cnt;
		this.like_cnt = like_cnt;
		this.product_idx = product_idx;
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getReserv() {
		return reserv;
	}

	public void setReserv(String reserv) {
		this.reserv = reserv;
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
		return "MySalesVO [id=" + id + ", thumbnail=" + thumbnail + ", title=" + title + ", gu=" + gu + ", reserv="
				+ reserv + ", buy_chk=" + sold_chk + ", post_date=" + post_date + ", comment_cnt=" + comment_cnt
				+ ", like_cnt=" + like_cnt + ", product_idx=" + product_idx + ", price=" + price + "]";
	}
}
