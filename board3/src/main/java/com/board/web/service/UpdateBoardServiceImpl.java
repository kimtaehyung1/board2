package com.board.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.dao.BoardDAO;
import com.board.web.vo.BoardVO;

@Service
public class UpdateBoardServiceImpl implements UpdateBoardService {

	@Autowired
	private BoardDAO dao;
	
	@Override
	public void update(BoardVO vo){
		dao.update(vo);
	}
	@Override
	public BoardVO selectUpdate(BoardVO vo) throws Exception {
		return dao.selectUpdate(vo);
		
	}

}
