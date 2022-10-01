package day1010;

import java.sql.Date;

public class ReportMVO {
	private String id, reported_id;
	private int rr_idx;
	private Date reported_date;
	
	public ReportMVO() {
		
	}

	public ReportMVO(String id, String reported_id, int rr_idx, Date reported_date) {
		super();
		this.id = id;
		this.reported_id = reported_id;
		this.rr_idx = rr_idx;
		this.reported_date = reported_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReported_id() {
		return reported_id;
	}

	public void setReported_id(String reported_id) {
		this.reported_id = reported_id;
	}

	public int getRr_idx() {
		return rr_idx;
	}

	public void setRr_idx(int rr_idx) {
		this.rr_idx = rr_idx;
	}

	public Date getReported_date() {
		return reported_date;
	}

	public void setReported_date(Date reported_date) {
		this.reported_date = reported_date;
	}

	@Override
	public String toString() {
		return "ReportMVO [id=" + id + ", reported_id=" + reported_id + ", rr_idx=" + rr_idx + ", reported_date="
				+ reported_date + "]";
	}
	
}
