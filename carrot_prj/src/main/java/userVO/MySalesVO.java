package userVO;

import java.sql.Date;

public class MySalesVO {
	private String id, product_idx, thumbnail, title, gu, reserved,sold_check,buyer_id;
	private Date posted_date,purchased_date;
	private int comment_cnt, liked_cnt, price;
	
	
	public MySalesVO() {
	}

	public MySalesVO(String id, String product_idx, String thumbnail, String title, String gu, String reserved,
			String sold_check, String buyer_id, Date posted_date, Date purchased_date, int comment_cnt, int liked_cnt,
			int price) {
		super();
		this.id = id;
		this.product_idx = product_idx;
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.reserved = reserved;
		this.sold_check = sold_check;
		this.buyer_id = buyer_id;
		this.posted_date = posted_date;
		this.purchased_date = purchased_date;
		this.comment_cnt = comment_cnt;
		this.liked_cnt = liked_cnt;
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
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

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public Date getPosted_date() {
		return posted_date;
	}

	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}

	public Date getPurchased_date() {
		return purchased_date;
	}

	public void setPurchased_date(Date purchased_date) {
		this.purchased_date = purchased_date;
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
		return "MySalesVO [id=" + id + ", product_idx=" + product_idx + ", thumbnail=" + thumbnail + ", title=" + title
				+ ", gu=" + gu + ", reserved=" + reserved + ", sold_check=" + sold_check + ", buyer_id=" + buyer_id
				+ ", posted_date=" + posted_date + ", purchased_date=" + purchased_date + ", comment_cnt=" + comment_cnt
				+ ", liked_cnt=" + liked_cnt + ", price=" + price + "]";
	}

	
	
}


	
	
	

	