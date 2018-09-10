package com.board.web.service;

import com.board.web.vo.BoardVO;

public interface DeleteBoardService {
	public int delete(BoardVO vo);
	public int passCheck(BoardVO vo);
}
