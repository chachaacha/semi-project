package managerVO;

public class HomeMemberVO {
	private int member_cnt;
	private String quit;
	
	public HomeMemberVO() {
		
	}

	public HomeMemberVO(int member_cnt, String quit) {
		super();
		this.member_cnt = member_cnt;
		this.quit = quit;
	}

	public int getMember_cnt() {
		return member_cnt;
	}

	public void setMember_cnt(int member_cnt) {
		this.member_cnt = member_cnt;
	}

	public String getQuit() {
		return quit;
	}

	public void setQuit(String quit) {
		this.quit = quit;
	}

	@Override
	public String toString() {
		return "HomeMemberVO [member_cnt=" + member_cnt + ", quit=" + quit + "]";
	}
	
}
