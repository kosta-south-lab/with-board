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
import withboard.mvc.domain.Meet;
import withboard.mvc.domain.Normal;
import withboard.mvc.service.NormalBoardService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/normal")
public class NormalBoardController {
	
	private final NormalBoardService normalBoardService;
	
	/**
	 * 전체검색하기
	 * */
	@RequestMapping("/normalList")
	public ModelAndView list(Long normalCategoryNo, String searchOption, String keyword) {
		
		if(normalCategoryNo == null) {
			normalCategoryNo = 1L;
		}
		if(searchOption == null) {
			searchOption = "title";
		}
		if(keyword == null) {
			keyword = "";
		}
		
		List<Normal> normalList = normalBoardService.selectAll(normalCategoryNo, searchOption, keyword);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/normal/normalList");          //
		mv.addObject("normalList", normalList);
		mv.addObject("normalCategoryNo", normalCategoryNo);
		return mv;
	}
	
	/**
	 * 등록폼 
	 * */
	@RequestMapping("/registerForm")
	public ModelAndView writeForm() {
		return new ModelAndView("board/normal/normalRegister");
	}
	
	/**
	 * 등록하기
	 * */
	@RequestMapping("/insert")
    public String insert(Normal normal, Long normalCategoryNo) {
		
		//등록전에 입력한 데이터에 유효하지  않는 특수문자, 스크립트태그등이 있으면 태그가 아닌 문자열로 변경한다.  - 실무에서 filter로 적용
		normal.getContent().replace("<", "&lt;");
		normalBoardService.insert(normal,normalCategoryNo);
		
		return "redirect:/board/normal/normalList";
	}
	
	/**
	 * 상세보기
	 * */
	@RequestMapping("/read/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo , String flag) {
		
		boolean state = flag==null ? true : false;
		Normal normal = normalBoardService.selectBy(boardNo, state);//true는 조회수증가!!!
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("board/normal/normalRead");
		mv.addObject("normal", normal);
		return mv;
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm/{boardNo}")
	public ModelAndView updateForm(@PathVariable Long boardNo) {
		Normal normal = normalBoardService.selectBy(boardNo, false);//조회수 증가안됨.
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/normal/updateForm");
		mv.addObject("normal", normal);
		
		 return mv;
	}
	
	/**
	 * 수정완료
	 * */
	@RequestMapping("/update")
	public String update(Normal normal, Long normalCategoryNo) {
		Normal nm = normalBoardService.update(normal,normalCategoryNo);
		
		return "redirect:/board/normal/read/" + nm.getBoardNo() + "?flag=1";
		
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/delete/{boardNo}")
	public String delete(@PathVariable Long boardNo) {
		normalBoardService.delete(boardNo);
		 
		 return "redirect:/board/normal/normalList";
		 
	}


}
