package jspbook;

import java.util.ArrayList;
import java.util.List;

public class AddrManager {

	// 주소록 목록을 관리하기 위한 ArrayList
	List<AddrBean> addrlist = new ArrayList<AddrBean>();

	// 주소록에 정보 추가하는 메서드
	public void add(AddrBean ab) {
		addrlist.add(ab);// 학생1 주소 추가
	}

	// 주소록에 있는 정보 출력
	public List<AddrBean> getAddrlist() {
		return addrlist;
	}

	// 특정 사용자를 주소록 목록에서 검색하는 메서드
	public AddrBean getAdd(String username) {

		for (AddrBean ab : addrlist) {
			if (ab.getUsername().equals(username)) return ab;
		}
		return null;
	}

}
