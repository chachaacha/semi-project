package managerVO;

public class LocVO {
	private String Gu;
	
	public LocVO() {

	}

	public LocVO(String gu) {
		super();
		Gu = gu;
	}

	public String getGu() {
		return Gu;
	}

	public void setGu(String gu) {
		Gu = gu;
	}

	@Override
	public String toString() {
		return "GuVO [Gu=" + Gu + "]";
	}
	
	
	
}
