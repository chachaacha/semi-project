package userVO;

public class MainFlagVO {
	private int categoryFlag, guFlag, orderByFlag, priceFlag, minPrice, maxPrice;
	private String freeFlag;
	
	public MainFlagVO() {
		// TODO Auto-generated constructor stub
	}

	public MainFlagVO(int categoryFlag, int guFlag, int orderByFlag, int priceFlag, int minPrice, int maxPrice,
			String freeFlag) {
		this.categoryFlag = categoryFlag;
		this.guFlag = guFlag;
		this.orderByFlag = orderByFlag;
		this.priceFlag = priceFlag;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.freeFlag = freeFlag;
	}

	public int getCategoryFlag() {
		return categoryFlag;
	}

	public void setCategoryFlag(int categoryFlag) {
		this.categoryFlag = categoryFlag;
	}

	public int getGuFlag() {
		return guFlag;
	}

	public void setGuFlag(int guFlag) {
		this.guFlag = guFlag;
	}

	public int getOrderByFlag() {
		return orderByFlag;
	}

	public void setOrderByFlag(int orderByFlag) {
		this.orderByFlag = orderByFlag;
	}

	public int getPriceFlag() {
		return priceFlag;
	}

	public void setPriceFlag(int priceFlag) {
		this.priceFlag = priceFlag;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getFreeFlag() {
		return freeFlag;
	}

	public void setFreeFlag(String freeFlag) {
		this.freeFlag = freeFlag;
	}

	
	
	
	
}
