package managerVO;

import java.sql.Date;

public class ProductVO {
	private String product_idx, title, id, category, sold_check;
	private Date posted_date;
	private int report_cnt;
	
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}


	public String getProduct_idx() {
		return product_idx;
	}


	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
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


	public String getSold_check() {
		return sold_check;
	}


	public void setSold_check(String sold_check) {
		this.sold_check = sold_check;
	}


	public Date getPosted_date() {
		return posted_date;
	}


	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}


	public int getReport_cnt() {
		return report_cnt;
	}


	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}


	@Override
	public String toString() {
		return "ProductVO [product_idx=" + product_idx + ", title=" + title + ", id=" + id + ", category=" + category
				+ ", sold_check=" + sold_check + ", posted_date=" + posted_date + ", report_cnt=" + report_cnt + "]";
	}

	
	

}