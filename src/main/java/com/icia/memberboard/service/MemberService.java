package com.icia.memberboard.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.repository.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private HttpSession session;

	public int m_save(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
//		System.out.println("m_filename: " + m_filename);
		String savePath = "F:\\Development_F\\source\\spring\\MemberBoard\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		}
		member.setM_filename(m_filename);
//		mr.m_save(member);
		System.out.println("service: " + member);
		int result = mr.m_save(member);
		return result;
	}

	public MemberDTO m_mypage(long m_number) {
		MemberDTO member = mr.m_mypage(m_number);
		System.out.println("ServiceImpl_m_mypage : "+ member);
		return member;
	}

	public String m_login(MemberDTO member) {
		MemberDTO loginMember = mr.m_login(member);	
		if(loginMember != null) { 
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", loginMember.getM_number());
			return "redirect:/board/paging";
			
		} else {
			return "member/m_login";
				}
			}

	@RequestMapping(value="member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
		}
	
	public List<MemberDTO> m_findAll() {
		List<MemberDTO> memberList = mr.m_findAll();
			return memberList;
	}


	public MemberDTO m_findById(long m_number) {
		MemberDTO member = mr.m_findById(m_number);
		return member;
	}


	public void m_delete(long m_number) {
		mr.m_delete(m_number);
		
	}

	public MemberDTO m_update(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_file = member.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "F:\\Development_F\\source\\spring\\MemberBoard\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		}		
		member.setM_filename(m_filename);
		mr.m_update(member);
		return member;
	}

	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if(result == null)
			return "ok";
		else
			return "no";
	}





}
