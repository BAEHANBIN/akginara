package org.akginara.service;

import org.akginara.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO member);
	public MemberVO get(String userid);
}
