package com.icia.memberboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentService cs;
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment){
		System.out.println("CommentController.save(): " + comment);
		cs.save(comment);
		List<CommentDTO> commentList = cs.findAll(comment.getB_number());		
		return commentList;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number, @RequestParam("c_number") long c_number,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		String result = cs.delete(b_number, c_number, page);
		return result;

	}
	
}
