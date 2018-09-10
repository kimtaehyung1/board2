package com.board.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.dao.BoardDAO;
import com.board.web.vo.BoardVO;
import com.board.web.vo.CommentVO;

@Service
public class SelectBoardServiceImpl implements SelectBoardService {

	@Autowired
	private BoardDAO dao;
	
	public List<BoardVO> list(int start, int end, String search_option,String keyword) throws Exception {
		return dao.list( start, end, search_option,keyword);
	}

	@Override
	public BoardVO detailBoard(int num) {
		BoardVO vo = dao.detailBoard(num);
		return vo;
	}

	@Override
	public void viewCount(int num) {
		 dao.viewCount(num);
	}


	@Override
	public int countArticle(String search_option, String keyword) {
		
		return dao.countArticle(search_option, keyword);
	}

	@Override
	public void reviewInsert(BoardVO vo) {
		dao.reviewInsert(vo);
	}

	@Override
	public void reviewUpdate(BoardVO vo) {
		dao.reviewUpdate(vo);
	}


	@Override
	public List<CommentVO> commentList(CommentVO cvo) {
		return dao.commentList(cvo);
	}

	@Override
	public int commentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.commentInsert(cvo);
	}

	@Override
	public int commentUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.commentUpdate(cvo);
	}

	@Override
	public int commentDelete(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.commentDelete(cvo);
	}

	@Override
	public int commentPassCheck(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.commentPassCheck(cvo);
	}

	@Override
	public int commentCommentUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.commentCommentUpdate(cvo);
	}

	@Override
	public int cocomentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.cocomentInsert(cvo);
	}

	@Override
	public int commentCount(int num) {
		// TODO Auto-generated method stub
		return  dao.commentCount(num);
	}

	/*@Override
	public int commentUpdateInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		return dao.commentUpdateInsert(cvo);
	}
*/
	/*@Override
	public int commentCountArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return dao.commentCountArticle(search_option, keyword);
	}

	*/
}
