package com.board.web.service;

import java.util.List;

import com.board.web.vo.BoardVO;
import com.board.web.vo.CommentVO;

public interface SelectBoardService {
	public List<BoardVO> list(int start, int end, String search_option,String keyword) throws Exception;
	public BoardVO detailBoard(int num);
	public void viewCount(int num);
	public int countArticle(String search_option,String keyword);
	//답글
	public void reviewInsert(BoardVO vo);
	public void reviewUpdate(BoardVO vo);
	//댓글
	public List<CommentVO> commentList(CommentVO cvo);
	public int commentInsert(CommentVO cvo);
	public int commentUpdate(CommentVO cvo);
	public int commentDelete(CommentVO cvo);
	public int commentPassCheck(CommentVO cvo);
	public int commentCommentUpdate(CommentVO cvo);
	public int commentCount(int num);
	//대댓글
	public int cocomentInsert(CommentVO cvo);
	//public int commentUpdateInsert(CommentVO cvo);
	//public int commentCountArticle(String search_option,String keyword);
}
