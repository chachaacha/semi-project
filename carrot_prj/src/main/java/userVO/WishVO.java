package userVO;

public class WishVO {
	private String id;
	private int product_idx;
	
	public WishVO() {

	}

	public WishVO(String id, int product_idx) {
		super();
		this.id = id;
		this.product_idx = product_idx;
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

	@Override
	public String toString() {
		return "WishVO [id=" + id + ", product_idx=" + product_idx + "]";
	}
	
}
