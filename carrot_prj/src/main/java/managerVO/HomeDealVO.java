package managerVO;

public class HomeDealVO {
	private int doneDeal, amount;
	
	public HomeDealVO() {
		super();
	}//HomeDealVO

	public HomeDealVO(int doneDeal, int amount) {
		super();
		this.doneDeal = doneDeal;
		this.amount = amount;
	}

	public int getDoneDeal() {
		return doneDeal;
	}

	public void setDoneDeal(int doneDeal) {
		this.doneDeal = doneDeal;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "HomeDealVO [doneDeal=" + doneDeal + ", amount=" + amount + "]";
	}
	
}//HoemDealVO
