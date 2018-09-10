package com.board.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.web.vo.BoardVO;
import com.board.web.vo.CommentVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<BoardVO> list( int start, int end,String search_option,String keyword) throws Exception {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlsession.selectList("com.board.mapper.BoardMapper.select",map);
	}

	@Override
	public void insert(BoardVO vo) throws Exception {
		sqlsession.insert("com.board.mapper.BoardMapper.insert",vo);
	}
	
	@Override
	public int delete(BoardVO vo) {
		return sqlsession.delete("com.board.mapper.BoardMapper.delete",vo);
	}

	@Override
	public BoardVO detailBoard(int num) {
		BoardVO vo = sqlsession.selectOne("com.board.mapper.BoardMapper.detailBoard",num);
		return vo;
	}

	@Override
	public void viewCount(int num) {
		sqlsession.update("com.board.mapper.BoardMapper.viewCount",num);
	}
	@Override
	public void update(BoardVO vo) {
		sqlsession.update("com.board.mapper.BoardMapper.update",vo);
	}
	@Override
	public BoardVO selectUpdate(BoardVO vo) throws Exception{
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.board.mapper.BoardMapper.selectUpdate",vo);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("search_option", search_option); 
		return sqlsession.selectOne("com.board.mapper.BoardMapper.countArticle",map);
	}

	@Override
	public int passCheck(BoardVO vo) {
		
		return sqlsession.selectOne("com.board.mapper.BoardMapper.passCheck",vo);
	}

	@Override
	public void reviewInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlsession.insert("com.board.mapper.BoardMapper.reviewinsert",vo);
		
	}

	@Override
	public void reviewUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlsession.update("com.board.mapper.BoardMapper.reviewUpdate",vo);
	}


	@Override
	public List<CommentVO> commentList(CommentVO cvo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("com.board.mapper.BoardMapper.commentSelect", cvo);
	}

	@Override
	public int commentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		return sqlsession.insert("com.board.mapper.BoardMapper.commentInsert", cvo);
	}
/*
	@Override
	public int commentCountArticle(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("search_option", search_option); 
		return sqlsession.selectOne("com.board.mapper.BoardMapper.select",map);
	}*/

	@Override
	public int commentUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		return sqlsession.update("com.board.mapper.BoardMapper.commentUpdate", cvo);
	}

	@Override
	public int commentDelete(CommentVO cvo) {
		// TODO Auto-generated method stub
		return sqlsession.delete("com.board.mapper.BoardMapper.commentDelete",cvo);
	}

	@Override
	public int commentPassCheck(CommentVO cvo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.board.mapper.BoardMapper.commentPassCheck",cvo);
	}

	@Override
	public int commentCommentUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		return sqlsession.update("com.board.mapper.BoardMapper.commentCommentUpdate",cvo);
	}

	@Override
	public int cocomentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		return sqlsession.insert("com.board.mapper.BoardMapper.cocomentInsert",cvo);
	}

	@Override
	public int commentCount(int num) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("com.board.mapper.BoardMapper.commentCount",num);
	}
	
}
