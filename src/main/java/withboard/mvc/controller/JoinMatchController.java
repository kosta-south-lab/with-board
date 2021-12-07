package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.MatchBoard;
import withboard.mvc.domain.Member;
import withboard.mvc.service.JoinMatchService;
import withboard.mvc.service.MatchBoardService;

@Controller
@RequiredArgsConstructor

public class JoinMatchController {
	private final JoinMatchService joinMatchService;
	
	@RequestMapping("chat/joinMatchList")
	public ModelAndView list(HttpSession session) {
		List<JoinMatch> joinMatchList = joinMatchService.joinMatchList(session);
		
		return new ModelAndView("/chat/joinMatchList", "joinMatchList", joinMatchList);
	}
	
	@RequestMapping("/room/insert")
	public String insert(JoinMatch joinMatch, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
	    joinMatch.setMember(member);
	    System.out.println(joinMatch.getJoinMatchTitle());
		joinMatchService.insert(joinMatch);
		return "redirect:/room";
	}
	@RequestMapping("/chat/delete/{joinMatchNo}")
	public String delete(@PathVariable Long joinMatchNo) {
		joinMatchService.delete(joinMatchNo);
		return "redirect:/room";
	}

}
