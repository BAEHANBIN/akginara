package org.akginara.mapper;

import org.akginara.domain.MemberVO;

public interface MemberMapper {
	public void member_insert(MemberVO member);
	public void auth_insert(MemberVO member);
	public MemberVO read(String userid);
}
