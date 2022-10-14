package userVO;

public class BuyVO {
	
	private String product_idx,buy_id, sold_chk, reserved;
	
	public BuyVO() {
		// TODO Auto-generated constructor stub
	}

	public BuyVO(String product_idx, String buy_id, String sold_chk, String reserved) {
		super();
		this.product_idx = product_idx;
		this.buy_id = buy_id;
		this.sold_chk = sold_chk;
		this.reserved = reserved;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public String getBuy_id() {
		return buy_id;
	}

	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
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
		return "BuyVO [product_idx=" + product_idx + ", buy_id=" + buy_id + ", sold_chk=" + sold_chk + ", reserved="
				+ reserved + "]";
	}

}
