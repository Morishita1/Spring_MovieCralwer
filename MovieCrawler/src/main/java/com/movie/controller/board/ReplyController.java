package com.movie.controller.board;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.board.ReplyDTO;
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
	
	@ResponseBody
	@GetMapping(value = "delete")
	public void delete(ReplyDTO rDto) {
		rService.delete(rDto);
	}
	
	@ResponseBody
	@PostMapping(value = "write")
	public void write(ReplyDTO rDto, HttpSession session) {
		String name =(String) session.getAttribute("name");
		rDto.setWriter(name);
		rService.write(rDto);
		
	}
	
}
