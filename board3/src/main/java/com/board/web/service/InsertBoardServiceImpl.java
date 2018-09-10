package com.board.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.dao.BoardDAO;
import com.board.web.vo.BoardVO;

@Service
public class InsertBoardServiceImpl implements InsertBoardService {
	
	@Autowired
	private BoardDAO dao;
	@Override
	public void insert(BoardVO vo) throws Exception{
		dao.insert(vo);
	}
}
