package managerVO;

public class ProductSearchVO {
	private int categoryFlag;
	private String dateOrderFlag, reportOrderFlag;
	
	public ProductSearchVO() {
		// TODO Auto-generated constructor stub
	}

	public ProductSearchVO(int categoryFlag, String dateOrderFlag, String reportOrderFlag) {
		this.categoryFlag = categoryFlag;
		this.dateOrderFlag = dateOrderFlag;
		this.reportOrderFlag = reportOrderFlag;
	}

	public int getCategoryFlag() {
		return categoryFlag;
	}

	public void setCategoryFlag(int categoryFlag) {
		this.categoryFlag = categoryFlag;
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
		return "ProductSearchVO [categoryFlag=" + categoryFlag + ", dateOrderFlag="
				+ dateOrderFlag + ", reportOrderFlag=" + reportOrderFlag + "]";
	}
	
	
	
}
