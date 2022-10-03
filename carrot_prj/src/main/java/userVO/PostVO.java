package userVO;

public class PostVO {
	private int product_idx, price, gu_idx, category_idx;
	private String id, gu, category, free, title, thumbnail, contents;
	
	public PostVO() {
		// TODO Auto-generated constructor stub
	}

	public PostVO(int product_idx, int price, int gu_idx, int category_idx, String id, String gu, String category,
			String free, String title, String thumbnail, String contents) {
		super();
		this.product_idx = product_idx;
		this.price = price;
		this.gu_idx = gu_idx;
		this.category_idx = category_idx;
		this.id = id;
		this.gu = gu;
		this.category = category;
		this.free = free;
		this.title = title;
		this.thumbnail = thumbnail;
		this.contents = contents;
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

	public int getGu_idx() {
		return gu_idx;
	}

	public void setGu_idx(int gu_idx) {
		this.gu_idx = gu_idx;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFree() {
		return free;
	}

	public void setFree(String free) {
		this.free = free;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "PostVO [product_idx=" + product_idx + ", price=" + price + ", gu_idx=" + gu_idx + ", category_idx="
				+ category_idx + ", id=" + id + ", gu=" + gu + ", category=" + category + ", free=" + free + ", title="
				+ title + ", thumbnail=" + thumbnail + ", contents=" + contents + "]";
	}

}
