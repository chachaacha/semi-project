package userVO;

/**
 * 홈화면 VO
 * @author user
 *
 */
public class HomeVO {
	private String thumbnail, title, gu;
	private int price, comment_cnt, liked_cnt;
	
	public HomeVO() {
		
	}

	public HomeVO(String thumbnail, String title, String gu, int price, int comment_cnt, int liked_cnt) {
		this.thumbnail = thumbnail;
		this.title = title;
		this.gu = gu;
		this.price = price;
		this.comment_cnt = comment_cnt;
		this.liked_cnt = liked_cnt;
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

	@Override
	public String toString() {
		return "HomeVO [thumbnail=" + thumbnail + ", title=" + title + ", gu=" + gu + ", price=" + price
				+ ", comment_cnt=" + comment_cnt + ", liked_cnt=" + liked_cnt + "]";
	}
	
	
	
	
	
	
	
	
}
