package day1010;

public class WishListVO {
	
	private String thumbnail, title, gu, id;
	private int product_idx, price, comment_cnt, like_cnt;
	
	public WishListVO() {
	}

	public WishListVO(String humbnail, String title, String gu, String id, int product_idx, int price, int comment_cnt,
			int like_cnt) {
		super();
		this.thumbnail = humbnail;
		this.title = title;
		this.gu = gu;
		this.id = id;
		this.product_idx = product_idx;
		this.price = price;
		this.comment_cnt = comment_cnt;
		this.like_cnt = like_cnt;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "WishListVO [thumbnail=" + thumbnail + ", title=" + title + ", gu=" + gu + ", id=" + id + ", product_idx="
				+ product_idx + ", price=" + price + ", comment_cnt=" + comment_cnt + ", like_cnt=" + like_cnt + "]";
	} 

}
