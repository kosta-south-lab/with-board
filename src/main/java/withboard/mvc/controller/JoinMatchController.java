package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	private final MatchBoardService matchBoardService;
	@RequestMapping("chat/joinMatchList")
	public ModelAndView list(HttpSession session) {
		List<JoinMatch> joinMatchList = joinMatchService.joinMatchList(session);
		
		return new ModelAndView("/chat/joinMatchList", "joinMatchList", joinMatchList);
	}
	
	@RequestMapping("/room/insert")
	public String insert(JoinMatch joinMatch, HttpSession session,HttpServletRequest request) {
		Member member = (Member) session.getAttribute("member");
	    joinMatch.setMember(member);
	    
		joinMatchService.insert(joinMatch);
		
		List<JoinMatch> joinMatchList = joinMatchService.joinMatchList(session);
		JoinMatch[] strArray2 = joinMatchList.toArray(new JoinMatch[joinMatchList.size()]);
		System.out.println(strArray2);
		int lastnum=(Math.toIntExact(strArray2[0].getJoinMatchNo()));
		session.removeAttribute("roomNum");
		session.setAttribute("roomNum", lastnum);
		String referer = request.getHeader("Referer");
	
		 return "redirect:"+ referer;
	}
	@RequestMapping("/chat/delete/{joinMatchNo}")
	public String delete(@PathVariable Long joinMatchNo) {
		joinMatchService.delete(joinMatchNo);
		return "redirect:/multiView";
	}

}
