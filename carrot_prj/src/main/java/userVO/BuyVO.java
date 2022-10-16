package userVO;

public class BuyVO {
	
	private String product_idx,buyer_id, sold_chk, reserved;
	
	public BuyVO() {
		// TODO Auto-generated constructor stub
	}

	public BuyVO(String product_idx, String buyer_id, String sold_chk, String reserved) {
		super();
		this.product_idx = product_idx;
		this.buyer_id = buyer_id;
		this.sold_chk = sold_chk;
		this.reserved = reserved;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getSold_chk() {
		return sold_chk;
	}

	public void setSold_chk(String sold_chk) {
		this.sold_chk = sold_chk;
	}

	public String getReserved() {
		return reserved;
	}

	public void setReserved(String reserved) {
		this.reserved = reserved;
	}

	@Override
	public String toString() {
		return "BuyVO [product_idx=" + product_idx + ", buyer_id=" + buyer_id + ", sold_chk=" + sold_chk + ", reserved="
				+ reserved + "]";
	}
	
}
