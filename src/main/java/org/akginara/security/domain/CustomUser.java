package org.akginara.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.akginara.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	private static final long serialVersionUID = 1L;
	private MemberVO member;
	
	public CustomUser(String username, String userpw, Collection<? extends GrantedAuthority> auth) {
		super(username, userpw, auth);
	}
	
	public CustomUser(MemberVO member) {
		super(member.getUserid(), member.getUserpw(), member.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.member = member;
	}
}
