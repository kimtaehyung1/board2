package com.board.web.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.web.service.SelectBoardService;
import com.board.web.vo.BoardVO;
import com.board.web.vo.CommentVO;
import com.board.web.vo.PagerVO;

@Controller
public class BoardController {
	
	@Autowired
	private SelectBoardService service;
      
	 
	   
	//리스트보기
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public List<BoardVO> list(@RequestParam(defaultValue="all")String search_option,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="")String keyword,Model model)throws Exception{
		
		int count = service.countArticle(search_option, keyword);
		//int commentCount = service.commentCountArticle(search_option, keyword);
		
		PagerVO pager = new PagerVO(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<BoardVO> list = service.list(start, end, search_option, keyword);
		model.addAttribute("list",list);
		model.addAttribute("keyword",keyword);
		model.addAttribute("search_option",search_option);
		model.addAttribute("pager",pager);
		model.addAttribute("count",count);
		//model.addAttribute("commentCount",commentCount);
		System.out.println("리스트");
		return list;
	}
	
	//글쓰기
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write()throws Exception{
		
		System.out.println("글쓰기 ");
		return "write";
	}
	//상세페이지
	@RequestMapping(value="/detailBoard.do", method=RequestMethod.GET)
	public String detailBoard(int num, Model model,CommentVO cvo) {
		
		service.viewCount(num);
		List<CommentVO> com = service.commentList(cvo);
		service.detailBoard(num);
		model.addAttribute("count",service.commentCount(num));
		model.addAttribute("vo",service.detailBoard(num));
		model.addAttribute("com",com);
		System.out.println(com);
		System.out.println("상세페이지");
	
		//System.out.println("상세페이지"+service.detailBoard(num).toString());
		return "detailBoard";
	}
	//답글 페이지
	@RequestMapping(value="/reviewForm.do",method=RequestMethod.GET)
	public ModelAndView reviewForm(BoardVO vo) {
		
		ModelAndView mav = new ModelAndView();
		int ref = vo.getRef();
		System.out.println(ref);
		int step = vo.getStep();
		System.out.println(step);
		int depth = vo.getDepth();
		
		mav.addObject("ref",ref);
		mav.addObject("step",step);
		mav.addObject("depth",depth);
		
		return mav;
	}
	//답글 쓰기 이벤트
	@RequestMapping(value="/reviewInsert.do",method=RequestMethod.POST)
	public  String reviewInsert(BoardVO vo) {
		
		service.reviewUpdate(vo);
		service.reviewInsert(vo);
		return "redirect:list.do";
	}
	//댓글 리스트 
	@RequestMapping(value="/commentList.do")
	@ResponseBody //HTTP body 부분만 전달 XML, JSON으로 출력 할 때 사용
	public List<CommentVO> commentList(CommentVO cvo,Model model){
		
		/*model.addAttribute("vo",service.detailBoard(num));*/
		return service.commentList(cvo);
	}
	//댓글입력
	@RequestMapping(value="/commentInsert.do",method=RequestMethod.POST)
	@ResponseBody //HTTP body 부분만 전달 XML, JSON으로 출력 할 때 사용
	public int commentInsert(CommentVO cvo) {
		
		System.out.println(cvo.getName());
		System.out.println(cvo.getContent());
		return service.commentInsert(cvo);
	}
	//댓글 수정
	@RequestMapping(value="/commentUpadate.do",method=RequestMethod.POST)
	@ResponseBody
	public int commentUpdate(@RequestParam int comment_num
			,@RequestParam String name,@RequestParam String content,@RequestParam String password) {
		
		CommentVO cvo = new CommentVO();
		cvo.setComment_num(comment_num);
		cvo.setName(name);
		cvo.setPassword(password);
		cvo.setContent(content);
		System.out.println("댓글번호"+cvo.getComment_num());
		
		return service.commentUpdate(cvo);
	}
	//댓글 삭제 
	@RequestMapping(value="/commentDelete.do",method=RequestMethod.POST)
	@ResponseBody
	public int commentDelete (CommentVO cvo) {
		System.out.println(cvo.toString());
	
		return service.commentDelete(cvo);
	}
	//댓글 비번체크(화면)
	@RequestMapping(value="/commentPassCheck.do", method=RequestMethod.GET)
	public ModelAndView commentPassCheckGet(CommentVO cvo) {
		System.out.println(cvo.getComment_num());
	ModelAndView mav = new ModelAndView("commentPassCheck");
	mav.addObject("cvo",cvo);
	
	return mav;	
}
	//댓글 비번체크(이벤트)
	@RequestMapping(value="/commentPassCheck.do", method=RequestMethod.POST)
	public @ResponseBody Map<Object,Object> commentPassCheckPost(CommentVO cvo) {
		System.out.println("qjsgh"+cvo.getComment_num());
		boolean pc ;
		int count = service.commentPassCheck(cvo);
		
		
		System.out.println("count"+count);
		System.out.println("댓글"+cvo);
		Map<Object,Object> map = new HashMap<Object,Object>();
		if(count == 1) {
			pc = true;
			map.put("pc", pc);
			service.commentDelete(cvo);
			System.out.println("삭제");
		}else {
			pc = false;
			map.put("pc", pc);
		}
		return map;
	}
	//댓글 수정 비번 (화면)
	@RequestMapping(value="/commentUpdateCheck.do", method=RequestMethod.GET)
	public ModelAndView commentupdatecheckGet(CommentVO cvo) {
		
	ModelAndView mav = new ModelAndView("commentUpdateCheck");
	mav.addObject("cvo",cvo);
	return mav;	
}
	//댓글 수정 비번 (이벤트)
	@RequestMapping(value="/commentUpdateCheck.do", method=RequestMethod.POST)
	public @ResponseBody Map<Object,Object> commentupdatecheckPost(CommentVO cvo) {
		
		boolean pc ;
		int count = service.commentPassCheck(cvo);
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
	//대댓글 등록
	@RequestMapping(value="/cocommentInsert.do",method=RequestMethod.POST)
	@ResponseBody //HTTP body 부분만 전달 XML, JSON으로 출력 할 때 사용
	public int commentCommentInsert(CommentVO cvo) {
		
		service.commentCommentUpdate(cvo);
		System.out.println(cvo);
		System.out.println("저장?");
		return service.cocomentInsert(cvo);
	}
}
