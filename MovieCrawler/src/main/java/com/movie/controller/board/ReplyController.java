package com.movie.controller.board;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.service.board.ReplyService;

@RequestMapping("reply/*")
@Controller
public class ReplyController {

	@Inject
	private ReplyService rService;
	
	@GetMapping(value = "list")
	public String listAll(int bno, Model model) {
		model.addAttribute("replyList",rService.list(bno));
		
		return "board/commentlist";
	}
	
	
	
}
