package jspbook;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {
	
	private String name;
	private String email;
	
	public Member() {
		name="홍길동";
		email="test@test.com";
	}
	
	public Member(String name, String email) {
		super();
		this.name = name;
		this.email = email;
	}
	
	
	

}
