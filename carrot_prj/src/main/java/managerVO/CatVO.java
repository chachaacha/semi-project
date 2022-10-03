package managerVO;

public class CatVO {
	private String category;
	private int category_idx;
	
	public CatVO() {

	}

	public CatVO(String category, int category_idx) {
		super();
		this.category = category;
		this.category_idx = category_idx;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	@Override
	public String toString() {
		return "CatVO [category=" + category + ", category_idx=" + category_idx + "]";
	}
	
}
