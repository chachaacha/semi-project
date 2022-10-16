package userVO;

import java.sql.Date;

public class BlockUVO {
	private String id, blocked_id;
	private Date blocked_date;
	
	public BlockUVO() {
	}

	public BlockUVO(String id, String blocked_id, Date blocked_date) {
		super();
		this.id = id;
		this.blocked_id = blocked_id;
		this.blocked_date = blocked_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBlocked_id() {
		return blocked_id;
	}

	public void setBlocked_id(String blocked_id) {
		this.blocked_id = blocked_id;
	}

	public Date getBlocked_date() {
		return blocked_date;
	}

	public void setBlocked_date(Date blocked_date) {
		this.blocked_date = blocked_date;
	}

	@Override
	public String toString() {
		return "BlockUVO [id=" + id + ", blocked_id=" + blocked_id + ", blocked_date=" + blocked_date + "]";
	}

}
