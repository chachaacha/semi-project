package managerVO;

public class PopupVO {
	private int orderFlag;
	private String keyword;
	public int getOrderFlag() {
		return orderFlag;
	}
	public void setOrderFlag(int orderFlag) {
		this.orderFlag = orderFlag;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "PopupVO [orderFlag=" + orderFlag + ", keyword=" + keyword + "]";
	}
	
	
}
