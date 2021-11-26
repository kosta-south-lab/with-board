package withboard.mvc.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Board;
import withboard.mvc.domain.Normal;
import withboard.mvc.service.NormalBoardService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class NormalBoardController {
	
	private final NormalBoardService normalBoardService;
	
	/**
	 * 전체검색하기
	 * */
	@RequestMapping("/normal")
	public ModelAndView list() {
		
		List<Normal> normalBoardList=normalBoardService.selectAll();
				
		return new ModelAndView("board/normalBoard", "normalBoardList", normalBoardList);
		
	}
	
	/**
	 * 등록폼 
	 * */
	@RequestMapping("/write")
	public void write() {}
	
	/**
	 * 등록하기
	 * */
	@RequestMapping("/insert")
    public String insert(Normal normal) {
		
		//등록전에 입력한 데이터에 유효하지  않는 특수문자, 스크립트태그등이 있으면 태그가 아닌 문자열로 변경한다.  - 실무에서 filter로 적용
		normal.getContent().replace("<", "&lt;");
		
		normalBoardService.insert(normal);
		
		return "redirect:/board/normal";
	}
	
	/**
	 * 상세보기
	 * */
	@RequestMapping("/read/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo , String flag) {
		
		//boolean state = flag==null ? true : false;
		boolean state = flag==null ;
		
		Normal nm = normalBoardService.selectBy(boardNo, state);//true는 조회수증가!!!
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("board/read");
		mv.addObject("board", nm);
		return mv;
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long boardNo) {
		Normal nm = normalBoardService.selectBy(boardNo, false);//조회수 증가안됨.
		
		 ModelAndView mv = new ModelAndView("board/update", "normal", nm);
		 return mv;
	}
	
	/**
	 * 수정완료
	 * */
	@RequestMapping("/update")
	public ModelAndView update(Normal normal) {
		Normal nm = normalBoardService.update(normal);
		
		return new ModelAndView("board/read","normal", nm);
		
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long boardNo , String password) {
		normalBoardService.delete(boardNo, password);
		 
		 return "redirect:/board/list";
		 
	}


}
