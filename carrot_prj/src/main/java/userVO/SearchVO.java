package userVO;

/**
 * 홈화면 인기검색어 VO
 * @author user
 *
 */
public class SearchVO {
	private String word;
	
	public SearchVO() {
	}

	public SearchVO(String word) {
		this.word = word;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return "SearchVO [word=" + word + "]";
	}
	
	
	
	
}
