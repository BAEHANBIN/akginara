package org.akginara.service;

import org.akginara.domain.MemberVO;
import org.akginara.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO member) {
		log.info("register : " + member);
		mapper.member_insert(member);
		mapper.auth_insert(member);
	}

	@Override
	public MemberVO get(String userid) {
		log.info("get : " + userid);
		return mapper.read(userid);
	}

}
