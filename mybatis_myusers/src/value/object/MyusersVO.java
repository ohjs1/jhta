package value.object;

import java.sql.Date;

public class MyusersVO {
	private String id;
	private String pw;
	private String email;
	private Date mydate;
	
	public MyusersVO() {}

	public MyusersVO(String id, String pw, String email, Date mydate) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.mydate = mydate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getMydate() {
		return mydate;
	}

	public void setMydate(Date mydate) {
		this.mydate = mydate;
	}
}
