package userVO;

import java.sql.Date;

public class MyBlockVO {
	private String id, blocked_id, nick;
	private Date blocked_date;
	
	public MyBlockVO() {
	}

	public MyBlockVO(String id, String blocked_id, String nick, String gu, Date blocked_date) {
		super();
		this.id = id;
		this.blocked_id = blocked_id;
		this.nick = nick;
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

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Date getBlocked_date() {
		return blocked_date;
	}

	public void setBlocked_date(Date blocked_date) {
		this.blocked_date = blocked_date;
	}

	@Override
	public String toString() {
		return "MyBlockVO [id=" + id + ", blocked_id=" + blocked_id + ", nick=" + nick
				+ ", blocked_date=" + blocked_date + "]";
	}

}
