package com.board.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.dao.BoardDAO;
import com.board.web.vo.BoardVO;

@Service
public class DeleteBoardServiceImpl implements DeleteBoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	
	@Override
	public int delete(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.delete(vo);
	}


	@Override
	public int passCheck(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.passCheck(vo);
	}

}
