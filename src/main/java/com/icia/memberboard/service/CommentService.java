package com.icia.memberboard.service;

import java.util.List;

import com.icia.memberboard.dto.CommentDTO;

public interface CommentService {
	
	void save(CommentDTO comment);

	List<CommentDTO> findAll(long b_number);

	public String delete(long b_number, long c_number, int page);
	
}
