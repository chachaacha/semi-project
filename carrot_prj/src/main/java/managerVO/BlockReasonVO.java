package managerVO;

public class BlockReasonVO {
	private int br_idx;
	private String blocked_reason;
	
	public BlockReasonVO() {

	}

	public BlockReasonVO(int br_idx, String blocked_reason) {
		super();
		this.br_idx = br_idx;
		this.blocked_reason = blocked_reason;
	}

	public int getBr_idx() {
		return br_idx;
	}

	public void setBr_idx(int br_idx) {
		this.br_idx = br_idx;
	}

	public String getBlocked_reason() {
		return blocked_reason;
	}

	public void setBlocked_reason(String blocked_reason) {
		this.blocked_reason = blocked_reason;
	}

	@Override
	public String toString() {
		return "BlockReasonVO [br_idx=" + br_idx + ", blocked_reason=" + blocked_reason + "]";
	}
	
	
}
