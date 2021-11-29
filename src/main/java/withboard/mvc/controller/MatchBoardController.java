package withboard.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.service.MatchBoardService;

import withboard.mvc.domain.Board;
import withboard.mvc.domain.MatchBoard;
import withboard.mvc.service.NormalBoardService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/matchBoard")
public class MatchBoardController {
	private final MatchBoardService matchBoardService;
	
	@RequestMapping("/matchBoardList")
	public ModelAndView list() {
		List<MatchBoard> matchBoardList = MatchBoardService.selectAll();
		return new ModelAndView("board/matchBoard/matchBoardList", "matchBoardList", matchBoardList);
	}
	

}
