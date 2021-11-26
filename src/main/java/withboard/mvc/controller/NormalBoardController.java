package withboard.mvc.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	



}
