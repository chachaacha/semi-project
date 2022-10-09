package managerVO;

public class ProductSearchVO {
	private int categoryFlag , selStatus, dateOrderFlag, reportOrderFlag;
	
	public ProductSearchVO() {
		// TODO Auto-generated constructor stub
	}

	public int getCategoryFlag() {
		return categoryFlag;
	}

	public void setCategoryFlag(int categoryFlag) {
		this.categoryFlag = categoryFlag;
	}

	public int getSelStatus() {
		return selStatus;
	}

	public void setSelStatus(int selStatus) {
		this.selStatus = selStatus;
	}

	public int getDateOrderFlag() {
		return dateOrderFlag;
	}

	public void setDateOrderFlag(int dateOrderFlag) {
		this.dateOrderFlag = dateOrderFlag;
	}

	public int getReportOrderFlag() {
		return reportOrderFlag;
	}

	public void setReportOrderFlag(int reportOrderFlag) {
		this.reportOrderFlag = reportOrderFlag;
	}

	@Override
	public String toString() {
		return "ProductSearchVO [categoryFlag=" + categoryFlag + ", selStatus=" + selStatus + ", dateOrderFlag="
				+ dateOrderFlag + ", reportOrderFlag=" + reportOrderFlag + "]";
	}
	
	
}
