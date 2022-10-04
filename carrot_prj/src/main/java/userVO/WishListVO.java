package userVO;

public class WishListVO {
	
	private String product_idx, thumbnail, title, gu, id;
	private int  price, comment_cnt, like_cnt;
	
	public WishListVO() {
	}

	public WishListVO(String product_idx, String thumbnail, String title, String gu, String id, int price,
			int comment_cnt, int like_cnt) {
		this.product_idx = product_idx;
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.id = id;
		this.price = price;
		this.comment_cnt = comment_cnt;
		this.like_cnt = like_cnt;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
		return "WishListVO [product_idx=" + product_idx + ", thumbnail=" + thumbnail + ", title=" + title + ", gu=" + gu
				+ ", id=" + id + ", price=" + price + ", comment_cnt=" + comment_cnt + ", like_cnt=" + like_cnt + "]";
	}
	 
	
	

}
