package day1010;

import java.sql.Date;

public class BlockUVO {
	private String id, block_id;
	private Date block_date;
	
	public BlockUVO() {
	}

	public BlockUVO(String id, String block_id, Date block_date) {
		super();
		this.id = id;
		this.block_id = block_id;
		this.block_date = block_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBlock_id() {
		return block_id;
	}

	public void setBlock_id(String block_id) {
		this.block_id = block_id;
	}

	public Date getBlock_date() {
		return block_date;
	}

	public void setBlock_date(Date block_date) {
		this.block_date = block_date;
	}

	@Override
	public String toString() {
		return "BlockUVO [id=" + id + ", block_id=" + block_id + ", block_date=" + block_date + "]";
	}
	
}
