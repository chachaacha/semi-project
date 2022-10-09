package userVO;

import java.sql.Date;

public class BuyListVO {
	private String product_idx, buyer_id, thumbnail, title, gu, sold_check;
	private Date posted_date;
	private int comment_cnt, liked_cnt,  price;
	
	public BuyListVO() {
	}

	public BuyListVO(String product_idx, String buyer_id, String thumbnail, String title, String gu, String sold_check,
			Date posted_date, int comment_cnt, int liked_cnt, int price) {
		super();
		this.product_idx = product_idx;
		this.buyer_id = buyer_id;
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.sold_check = sold_check;
		this.posted_date = posted_date;
		this.comment_cnt = comment_cnt;
		this.liked_cnt = liked_cnt;
		this.price = price;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
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

	public String getSold_check() {
		return sold_check;
	}

	public void setSold_check(String sold_check) {
		this.sold_check = sold_check;
	}

	public Date getPosted_date() {
		return posted_date;
	}

	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}

	public int getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public int getLiked_cnt() {
		return liked_cnt;
	}

	public void setLiked_cnt(int liked_cnt) {
		this.liked_cnt = liked_cnt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BuyListVO [product_idx=" + product_idx + ", buyer_id=" + buyer_id + ", thumbnail=" + thumbnail
				+ ", title=" + title + ", gu=" + gu + ", sold_check=" + sold_check + ", posted_date=" + posted_date
				+ ", comment_cnt=" + comment_cnt + ", liked_cnt=" + liked_cnt + ", price=" + price + "]";
	}

}
