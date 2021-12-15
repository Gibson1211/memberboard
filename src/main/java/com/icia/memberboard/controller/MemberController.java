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
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	

	@RequestMapping(value="/member/m_save", method=RequestMethod.GET)
	public String m_save() {
		return "member/m_save";
	}
	

	@RequestMapping(value="/member/m_save", method=RequestMethod.POST)
	public String m_save(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		System.out.println("MemberController.m_save(): " + member);
		int result = ms.m_save(member);
		if(result > 0)
			return "index";
		else
			return "member/m_save";
	}	
	
	@RequestMapping(value = "/member/m_mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam("m_number") long m_number, Model model) throws IllegalStateException, IOException {		
		MemberDTO member = ms.m_mypage(m_number);
		model.addAttribute("m_mypage", member);
		System.out.println("controller_m_mypage : "+ member);		
		return "member/m_mypage";
	}


	@RequestMapping(value="member/m_login", method=RequestMethod.GET)
	public String loginForm() {
		return "member/m_login";
	}	
	

	@RequestMapping(value="member/m_login", method=RequestMethod.POST)
	public String m_login(@ModelAttribute MemberDTO member) {
		String resultPage=ms.m_login(member);
		return resultPage;
	}
	

	@RequestMapping(value="member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
		}
	
	
	@RequestMapping(value="member/m_findAll", method=RequestMethod.GET)
	public String m_findAll(Model model) {
		List<MemberDTO> memberList = ms.m_findAll();
		model.addAttribute("memberList", memberList);
		return "member/m_findAll";
		}
	

	@RequestMapping(value="member/m_detail", method=RequestMethod.GET)
	public String m_findById(@RequestParam("m_number") long m_number, Model model) {
	MemberDTO member = ms.m_findById(m_number);
	model.addAttribute("member", member);
	return "member/m_detail";
	}
	

	@RequestMapping(value="member/m_delete", method=RequestMethod.GET)
	public String m_delete(@RequestParam("m_number") long m_number) {
		ms.m_delete(m_number);
		return "redirect:/member/m_findAll";
	}
	

	@RequestMapping(value="member/m_update", method=RequestMethod.GET)
	public String m_updateForm(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.m_findById(m_number);
		model.addAttribute("member", member);
		System.out.println("수정화면 요청 : " + member);
		return "member/m_update";
	}

	@RequestMapping(value="member/m_update", method=RequestMethod.POST)
	public String m_update(@ModelAttribute MemberDTO member, Model model) throws IllegalStateException, IOException {
		ms.m_update(member);
		String result = "redirect:/member/m_mypage?m_number=" + member.getM_number(); 
		model.addAttribute("member", member);
		return result;
	}		
		
	@RequestMapping(value="member/idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		System.out.println("MemberController.idDuplicate(): " + m_id);
		String result = ms.idDuplicate(m_id);
		return result;
	}

}
