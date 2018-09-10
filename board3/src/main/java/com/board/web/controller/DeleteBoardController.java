package com.board.web.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.board.web.service.DeleteBoardService;
import com.board.web.service.SelectBoardService;
import com.board.web.vo.BoardVO;

@Controller
public class DeleteBoardController {
	
	@Autowired
	private DeleteBoardService deleteBoardService;
	@Autowired
	private SelectBoardService service;

	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	
	public @ResponseBody Map<Object,Object> passcheckPost(BoardVO vo,int num) {
	 
		deleteBoardService.delete(vo);
		System.out.println("삭제됩니다~");
		boolean pc ;
		int count = deleteBoardService.passCheck(vo);
		
		System.out.println("count"+count);
		Map<Object,Object> map = new HashMap<Object,Object>();
		if(count == 1) {
			pc = true;
			map.put("pc", pc);
			//deleteBoardService.delete(vo);
			//System.out.println("삭제");
		}else {
			pc = false;
			map.put("pc", pc);
		}
		return map;
	}
	/*@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	@ResponseBody
	public void delete(BoardVO vo,Model model) {
	 
		deleteBoardService.delete(vo);
		System.out.println("삭제됩니다~");
	}*/
	@RequestMapping(value="/PassCheck.do", method=RequestMethod.GET)
	public ModelAndView passcheckGet(BoardVO vo) {
		
	ModelAndView mav = new ModelAndView("passcheck");
	System.out.println("이름"+vo.getName());
	System.out.println("보드"+vo.toString());
	mav.addObject("vo",vo);
	return mav;	
}
	/*@RequestMapping(value="/PassCheck.do", method=RequestMethod.POST)
	public @ResponseBody Map<Object,Object> passcheckPost(BoardVO vo,int num) {
		
		boolean pc ;
		int count = deleteBoardService.passCheck(vo);
	
		//BoardVO bvo = service.detailBoard(num);
		
		System.out.println("count"+count);
		//System.out.println("bvo"+bvo.getDel());
		Map<Object,Object> map = new HashMap<Object,Object>();
		if(count == 1) {
			pc = true;
			map.put("pc", pc);
			//deleteBoardService.delete(vo);
			//System.out.println("삭제");
		}else {
			pc = false;
			map.put("pc", pc);
		}
		return map;
	}*/
}
