package com.board.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.web.service.InsertBoardService;
import com.board.web.vo.BoardVO;

@Controller
public class InsertBoardController {

	@Autowired
	private InsertBoardService insertBoardService;
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	synchronized public String InsertBoard(BoardVO vo)throws Exception{
		
		insertBoardService.insert(vo);
		System.out.println("등록페이지"+vo.toString());
		return "redirect:list.do";
	}
	
	
	
}
