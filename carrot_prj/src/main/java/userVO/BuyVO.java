package userVO;

public class BuyVO {
	
	private String buy_id, sold_chk;
	private int product_idx;
	
	public BuyVO() {
	}

	public BuyVO(String buy_id, String sold_chk, int product_idx) {
		super();
		this.buy_id = buy_id;
		this.sold_chk = sold_chk;
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

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	@Override
	public String toString() {
		return "BuyVO [buy_id=" + buy_id + ", sold_chk=" + sold_chk + ", product_idx=" + product_idx + "]";
	}
	
}
