package userVO;

public class LocVO {
	private int gu_idx;
	private String gu;
	
	public LocVO() {
		// TODO Auto-generated constructor stub
	}

	public LocVO(int gu_idx, String gu) {
		super();
		this.gu_idx = gu_idx;
		this.gu = gu;
	}

	public int getGu_idx() {
		return gu_idx;
	}

	public void setGu_idx(int gu_idx) {
		this.gu_idx = gu_idx;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	@Override
	public String toString() {
		return "LocVO [gu_idx=" + gu_idx + ", gu=" + gu + "]";
	}
	
}
