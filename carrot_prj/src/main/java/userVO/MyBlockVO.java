package userVO;

public class MyBlockVO {
	private String nickPlusId, blocked_id, addr1, id;
	
	public MyBlockVO() {
	}

	public String getNickPlusId() {
		return nickPlusId;
	}

	public void setNickPlusId(String nickPlusId) {
		this.nickPlusId = nickPlusId;
	}

	public String getBlocked_id() {
		return blocked_id;
	}

	public void setBlocked_id(String blocked_id) {
		this.blocked_id = blocked_id;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MyBlockVO [nickPlusId=" + nickPlusId + ", blocked_id=" + blocked_id + ", addr1=" + addr1 + ", id=" + id
				+ "]";
	}

		
	
	
	

}
