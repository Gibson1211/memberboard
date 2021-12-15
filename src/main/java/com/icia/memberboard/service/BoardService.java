package com.icia.memberboard.service;

import java.io.IOException;
import java.util.List;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.dto.PageDTO;

public interface BoardService {
	
	public void save(BoardDTO board) throws IllegalStateException, IOException;

	public List<BoardDTO> findAll();

	public BoardDTO findById(long b_number);

	public void delete(long b_number);

	public void update(BoardDTO board) throws IllegalStateException, IOException;

	public List<BoardDTO> pagingList(int page);

	public PageDTO paging(int page);

	public List<BoardDTO> search(String searchtype, String keyword);

	public void save(CommentDTO comment);

}
