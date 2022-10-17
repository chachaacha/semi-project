package userVO;

public class MainFlagVO {
	private int categoryFlag, guFlag, orderByFlag, priceFlag, minPrice, maxPrice, pageFlag;
	private String freeFlag, keyword, id;
	
	public MainFlagVO() {
		// TODO Auto-generated constructor stub
	}

	public MainFlagVO(int categoryFlag, int guFlag, int orderByFlag, int priceFlag, int minPrice, int maxPrice,
			int pageFlag, String freeFlag, String keyword, String id) {
		super();
		this.categoryFlag = categoryFlag;
		this.guFlag = guFlag;
		this.orderByFlag = orderByFlag;
		this.priceFlag = priceFlag;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.pageFlag = pageFlag;
		this.freeFlag = freeFlag;
		this.keyword = keyword;
		this.id = id;
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

	public int getPageFlag() {
		return pageFlag;
	}

	public void setPageFlag(int pageFlag) {
		this.pageFlag = pageFlag;
	}

	public String getFreeFlag() {
		return freeFlag;
	}

	public void setFreeFlag(String freeFlag) {
		this.freeFlag = freeFlag;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MainFlagVO [categoryFlag=" + categoryFlag + ", guFlag=" + guFlag + ", orderByFlag=" + orderByFlag
				+ ", priceFlag=" + priceFlag + ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", pageFlag="
				+ pageFlag + ", freeFlag=" + freeFlag + ", keyword=" + keyword + ", id=" + id + "]";
	}

}
