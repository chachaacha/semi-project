package userVO;

import java.sql.Date;

public class MySalesVO {
	private String id, product_idx, thumbnail, title, gu, reserved, sold_check;
	private Date post_date;
	private int comment_cnt, like_cnt, price;
	
	public MySalesVO() {
	}

	public MySalesVO(String id, String product_idx, String thumbnail, String title, String gu, String reserved,
			String sold_check, Date post_date, int comment_cnt, int like_cnt, int price) {
		this.id = id;
		this.product_idx = product_idx;
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.reserved = reserved;
		this.sold_check = sold_check;
		this.post_date = post_date;
		this.comment_cnt = comment_cnt;
		this.like_cnt = like_cnt;
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

	public void setSold_chk(String sold_check) {
		this.sold_check = sold_check;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "MySalesVO [id=" + id + ", product_idx=" + product_idx + ", thumbnail=" + thumbnail + ", title=" + title
				+ ", gu=" + gu + ", reserved=" + reserved + ", sold_check=" + sold_check + ", post_date=" + post_date
				+ ", comment_cnt=" + comment_cnt + ", like_cnt=" + like_cnt + ", price=" + price + "]";
	}
	
	

	
}
