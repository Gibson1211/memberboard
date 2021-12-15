package com.icia.memberboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentRepository cr;
	
	@Override
	public void save(CommentDTO comment) {
		cr.save(comment);		
	}

	@Override
	public List<CommentDTO> findAll(long b_number) {
		return cr.findAll(b_number);
	}

	@Override
	public String delete(long b_number, long c_number, int page) {
		int result = cr.delete(c_number);		
		if(result>0) {
			return "redirect:/board/detail?b_number="+b_number+"&page="+page;			
		}else {
			return "board/paging";
		}
	}

}
