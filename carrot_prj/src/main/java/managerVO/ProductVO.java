package managerVO;

import java.sql.Date;

public class ProductVO {
	private String title, id, category, sold_checked;
	private Date posted_date;
	private int reported_cnt;
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}

	public ProductVO(String title, String id, String category, String sold_checked, Date posted_date,
			int reported_cnt) {
		this.title = title;
		this.id = id;
		this.category = category;
		this.sold_checked = sold_checked;
		this.posted_date = posted_date;
		this.reported_cnt = reported_cnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSold_checked() {
		return sold_checked;
	}

	public void setSold_checked(String sold_checked) {
		this.sold_checked = sold_checked;
	}

	public Date getPosted_date() {
		return posted_date;
	}

	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}

	public int getReported_cnt() {
		return reported_cnt;
	}

	public void setReported_cnt(int reported_cnt) {
		this.reported_cnt = reported_cnt;
	}

	@Override
	public String toString() {
		return "ProductVO [title=" + title + ", id=" + id + ", category=" + category + ", sold_checked=" + sold_checked
				+ ", posted_date=" + posted_date + ", reported_cnt=" + reported_cnt + "]";
	}
	
	
	

}