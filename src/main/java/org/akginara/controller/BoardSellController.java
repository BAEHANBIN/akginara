package org.akginara.controller;

import org.akginara.domain.BoardSellVO;
import org.akginara.domain.Criteria;
import org.akginara.domain.PageDTO;
import org.akginara.service.BoardSellService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public void list(Criteria cri, Model model) {
		int total = service.getTotal(cri);
		log.info("list : " + cri);
		log.info("total : " + total);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	//@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	@PostMapping("/register")
	//@PreAuthorize("isAuthenticated()")
	public String register(BoardSellVO sell, RedirectAttributes rttr) {
		log.info("register : " + sell);
		if (sell.getAttachList() != null) {
			sell.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(sell);
		rttr.addFlashAttribute("result", sell.getWriter());
		return "redirect:/akginara/sell/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("sell", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardSellVO sell, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + sell);
		
		if (service.modify(sell)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/akginara/sell/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/akginara/sell/list";
	}
	
}