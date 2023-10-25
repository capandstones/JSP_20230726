package jspbook;

public class LoginBean {
	
	private String userid;
	private String passwd;
	
	//DB로 부터 가져온 아이디와 비밀번호로 가정함
	final String _userid="myuser";
	final String _password="12345";
	
	//로그인 계정 정보가 맞는지 확인하는 메서드
	public boolean checkUser() {
		if(userid.equals(_userid) && passwd.equals(_password)) {
			return true;
		}else return false;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	
	
}
