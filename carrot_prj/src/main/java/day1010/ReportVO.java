package day1010;

public class ReportVO {
	private int rr_idx;
	private String report_type, contents;
	
	public ReportVO() {
	}

	public ReportVO(int rr_idx, String report_type, String contents) {
		super();
		this.rr_idx = rr_idx;
		this.report_type = report_type;
		this.contents = contents;
	}

	public int getRr_idx() {
		return rr_idx;
	}

	public void setRr_idx(int rr_idx) {
		this.rr_idx = rr_idx;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "ReportVO [rr_idx=" + rr_idx + ", report_type=" + report_type + ", contents=" + contents + "]";
	}
	
}
