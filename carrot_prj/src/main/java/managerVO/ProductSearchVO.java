package managerVO;

public class ProductSearchVO {
	private int categoryFlag , selStatus;
	private String dateOrderFlag, reportOrderFlag;
	
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

	public String getDateOrderFlag() {
		return dateOrderFlag;
	}

	public void setDateOrderFlag(String dateOrderFlag) {
		this.dateOrderFlag = dateOrderFlag;
	}

	public String getReportOrderFlag() {
		return reportOrderFlag;
	}

	public void setReportOrderFlag(String reportOrderFlag) {
		this.reportOrderFlag = reportOrderFlag;
	}

	@Override
	public String toString() {
		return "ProductSearchVO [categoryFlag=" + categoryFlag + ", selStatus=" + selStatus + ", dateOrderFlag="
				+ dateOrderFlag + ", reportOrderFlag=" + reportOrderFlag + "]";
	}

	
	
	
}
