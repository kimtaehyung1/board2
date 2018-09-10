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
import com.board.web.service.UpdateBoardService;
import com.board.web.vo.BoardVO;

@Controller
public class UpdateBoardController {
		
	@Autowired
	private UpdateBoardService updateBoardService;
	@Autowired
	private DeleteBoardService deleteBoardService;
			
	@RequestMapping(value="/update.do", method=RequestMethod.GET)
	public ModelAndView update(BoardVO vo) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",updateBoardService.selectUpdate(vo));		
		System.out.println("업데이트 메소드 : "+ vo);
		return mav;
	}
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public  String updateInsert(BoardVO vo) {
		
		System.out.println("업데이트 확인"+vo);
		updateBoardService.update(vo);
		return "redirect:list.do";
	}
	@RequestMapping(value="/updateCheck.do", method=RequestMethod.GET)
	public ModelAndView passcheckGet(BoardVO vo) {
		
	ModelAndView mav = new ModelAndView("updatecheck");
	mav.addObject("vo",vo);
	return mav;	
}
	
	@RequestMapping(value="/updateCheck.do", method=RequestMethod.POST)
	public @ResponseBody Map<Object,Object> passcheckPost(BoardVO vo) {
		
		boolean pc ;
		int count = deleteBoardService.passCheck(vo);
		System.out.println("count"+count);
		Map<Object,Object> map = new HashMap<Object,Object>();
		if(count == 1) {
			pc = true;
			map.put("pc", pc);
		}else {
			pc = false;
			map.put("pc", pc);
		}
		return map;
	}

}
