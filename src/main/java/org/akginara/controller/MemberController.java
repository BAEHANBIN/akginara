package org.akginara.controller;

import org.akginara.domain.MemberVO;
import org.akginara.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/akginara/*")
@Log4j
public class MemberController {
	private MemberService service;
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberVO member) {
		log.info("register : " + member);
		service.register(member);
		return "redirect:/akginara/login";
	}
}
