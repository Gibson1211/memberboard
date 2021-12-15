package com.icia.memberboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.dto.PageDTO;
import com.icia.memberboard.service.BoardService;
import com.icia.memberboard.service.CommentService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	@Autowired
	private BoardService bs;
	
	@Autowired
	private CommentService cs;
	
	@RequestMapping(value="save", method=RequestMethod.GET)
	public String saveForm() {
		return "board/save";
	}
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public String save(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		bs.save(board);	
	return "redirect:/board/paging";
	}
	

	@RequestMapping(value="findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		List<BoardDTO> boardList = bs.findAll();
		model.addAttribute("boardList", boardList);
		return "board/findAll";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String findById(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		BoardDTO board = bs.findById(b_number);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		List<CommentDTO> commentList = cs.findAll(b_number);
		model.addAttribute("commentList", commentList);
		return "board/detail";
	}
	
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number) {
		bs.delete(b_number);
		return "redirect:/board/paging";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1") int page){ 
		BoardDTO board = bs.findById(b_number);
		model.addAttribute("board", board);
		model.addAttribute("page", page);		
		return "board/update"; 
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO board, @RequestParam(value="page", required=false, defaultValue="1") int page) throws IllegalStateException, IOException {
		bs.update(board);
		return "redirect:/board/detail?b_number="+board.getB_number()+ "&page=" +page;
	}
	
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
		PageDTO paging = bs.paging(page);
		List<BoardDTO> boardList = bs.pagingList(page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		System.out.println("controller : " + boardList);
		System.out.println("controller : " + paging);
		return "board/findAll";
	}

	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword, Model model) {
			List<BoardDTO> boardList=bs.search(searchtype, keyword);
			System.out.println("controller : " + boardList);
			model.addAttribute("boardList", boardList);
			return "board/findAll";
	}
	
}
