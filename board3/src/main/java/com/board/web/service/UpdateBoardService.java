package com.board.web.service;

import com.board.web.vo.BoardVO;

public interface UpdateBoardService {
	public void update(BoardVO vo);
	public BoardVO selectUpdate(BoardVO vo)throws Exception;
}
