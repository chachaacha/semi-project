package userVO;

public class WishListVO {
	
	private String product_idx, thumbnail, title, gu, id;
	private int  price, comment_cnt, liked_cnt, gu_idx;
	
	public WishListVO() {
	}

	public WishListVO(String product_idx, String thumbnail, String title, String gu, String id, int price,
			int comment_cnt, int liked_cnt, int gu_idx) {
		super();
		this.product_idx = product_idx;
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.id = id;
		this.price = price;
		this.comment_cnt = comment_cnt;
		this.liked_cnt = liked_cnt;
		this.gu_idx = gu_idx;
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

	public int getLiked_cnt() {
		return liked_cnt;
	}

	public void setLiked_cnt(int liked_cnt) {
		this.liked_cnt = liked_cnt;
	}

	public int getGu_idx() {
		return gu_idx;
	}

	public void setGu_idx(int gu_idx) {
		this.gu_idx = gu_idx;
	}

	@Override
	public String toString() {
		return "WishListVO [product_idx=" + product_idx + ", thumbnail=" + thumbnail + ", title=" + title + ", gu=" + gu
				+ ", id=" + id + ", price=" + price + ", comment_cnt=" + comment_cnt + ", liked_cnt=" + liked_cnt
				+ ", gu_idx=" + gu_idx + "]";
	}

}
