package org.akginara.controller;

import org.akginara.domain.BoardSellVO;
import org.akginara.service.BoardSellService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/akginara/sell/*")
@AllArgsConstructor
public class BoardSellController {
	
	private BoardSellService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	//@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	@PostMapping("/register")
	//@PreAuthorize("isAuthenticated()")
	public String register(BoardSellVO sell, RedirectAttributes rttr) {
		log.info("register : " + sell);
		service.register(sell);
		rttr.addFlashAttribute("result", sell.getBno());
		return "redirect:/akginara/sell/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("sell", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardSellVO sell, RedirectAttributes rttr) {
		log.info("modify : " + sell);
		
		if (service.modify(sell)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/akginara/sell/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/akginara/sell/list";
	}
	
}