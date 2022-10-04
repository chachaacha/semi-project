package userVO;

public class WishVO {
	private String id,product_idx;
	
	public WishVO() {
		// TODO Auto-generated constructor stub
	}

	public WishVO(String id, String product_idx) {
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

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	@Override
	public String toString() {
		return "WishVO [id=" + id + ", product_idx=" + product_idx + "]";
	}
	
	
	
}
