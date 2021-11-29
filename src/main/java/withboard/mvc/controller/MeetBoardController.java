package withboard.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Meet;
import withboard.mvc.service.MeetBoardService;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class MeetBoardController {
	
	private final MeetBoardService meetBoardService;
	
	/**
	 * 모임 목록 페이지
	 * */
	@RequestMapping("/meet")
	public ModelAndView selectAll() {
		List<Meet> meetList = meetBoardService.selectAll();
		return new ModelAndView("board/meet/meetList", "meetList", meetList);
	}
	
	/**
	 * 모임 등록 폼
	 * */
	public ModelAndView writeForm() {
		return new ModelAndView("");
	}
	
	/**
	 * 모임 등록
	 * */
	@RequestMapping("/meet/insert")
	public ModelAndView insert() {
		return null;
		
	}
}
