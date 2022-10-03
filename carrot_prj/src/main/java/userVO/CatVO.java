package userVO;

public class CatVO {
	private int category_idx;
	private String category;
	
	public CatVO() {
		// TODO Auto-generated constructor stub
	}

	public CatVO(int category_idx, String category) {
		super();
		this.category_idx = category_idx;
		this.category = category;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "CatVO [category_idx=" + category_idx + ", category=" + category + "]";
	}
	
}
