package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import withboard.mvc.domain.Member;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/matchBoard")
public class MatchBoardController {
	private final MatchBoardService matchBoardService;
	
	@RequestMapping("/matchBoardList")
	public ModelAndView list() {
		List<MatchBoard> matchBoardList = matchBoardService.selectAll();
		return new ModelAndView("board/matchBoard/matchBoardList", "matchBoardList", matchBoardList);
	}
	
	@RequestMapping("/insert")
	public String insert(MatchBoard matchBoard, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		matchBoardService.insert(matchBoard,member);
		return "redirect:/board/matchBoard/matchBoardList";
	}
	
	@RequestMapping("/delete/{boardNo}")
	public String delete(@PathVariable Long boardNo) {
		matchBoardService.delete(boardNo);
		return "redirect:/board/matchBoard/matchBoardList";
	}
	
	@RequestMapping("/update")
	public ModelAndView update(MatchBoard matchBoard) {
		MatchBoard mb = matchBoardService.update(matchBoard);
		
		return new ModelAndView("board/matchBoard/matchBoardRead","matchBoard",mb);
	}
	
	@RequestMapping("/updateForm/{boardNo}")
	public ModelAndView updateForm(@PathVariable Long boardNo) {
		MatchBoard mb = matchBoardService.selectBy(boardNo, false);
		
		 ModelAndView mv = new ModelAndView("board/matchBoard/matchBoardupdateForm", "matchBoard", mb);
		 return mv;
	}
	
	@RequestMapping("/read/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo , String flag) {
		System.out.println("ddd "+boardNo);
		
		//boolean state = flag==null ? true : false;
		boolean state = flag==null ;
		
		MatchBoard matchBoard = matchBoardService.selectBy(boardNo, state);
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("board/matchBoard/matchBoardRead");
		mv.addObject("matchBoard", matchBoard);
		return mv;
	}
	
	@RequestMapping("/registerForm")
	public ModelAndView writeForm() {
		return new ModelAndView("board/matchBoard/matchBoardRegister");
	}
	@RequestMapping("/test")
	public ModelAndView test() {
		return new ModelAndView("board/matchBoard/test");
	}
	

}
