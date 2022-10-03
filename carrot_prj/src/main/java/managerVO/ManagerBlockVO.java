package managerVO;

public class ManagerBlockVO {
	private int br_idx;
	private String id, name, blocked_reason;
	
	public ManagerBlockVO() {

	}

	public ManagerBlockVO(int br_idx, String id, String name, String blocked_reason) {
		super();
		this.br_idx = br_idx;
		this.id = id;
		this.name = name;
		this.blocked_reason = blocked_reason;
	}

	public int getBr_idx() {
		return br_idx;
	}

	public void setBr_idx(int br_idx) {
		this.br_idx = br_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBlocked_reason() {
		return blocked_reason;
	}

	public void setBlocked_reason(String blocked_reason) {
		this.blocked_reason = blocked_reason;
	}

	@Override
	public String toString() {
		return "ManagerBlockVO [br_idx=" + br_idx + ", id=" + id + ", name=" + name + ", blocked_reason="
				+ blocked_reason + "]";
	}
	
}
