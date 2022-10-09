package managerVO;

import java.sql.Date;

public class CommentVO {
	private String contents, id, title, productTitle, product_idx;
	private Date posted_date;
	private int reported_cnt;
	
	public CommentVO() {
		// TODO Auto-generated constructor stub
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
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
		return "CommentVO [contents=" + contents + ", id=" + id + ", title=" + title + ", productTitle=" + productTitle
				+ ", product_idx=" + product_idx + ", posted_date=" + posted_date + ", reported_cnt=" + reported_cnt
				+ "]";
	}

	
	
}
