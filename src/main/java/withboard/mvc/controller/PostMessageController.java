package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.PostMessage;
import withboard.mvc.service.PostMessageService;

@Controller
@RequiredArgsConstructor
public class PostMessageController {
	
	private final PostMessageService postMessageService;
	
	@RequestMapping("/pm/pmForm")
	public void pmForm() {}
	
	@RequestMapping("/pm/pmList")
	public ModelAndView pmList(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		List<PostMessage> postMessageList = postMessageService.selectAll(member);
		ModelAndView mv = new ModelAndView("pm/pmList", "postMessageList", postMessageList);
		return mv;
	}
	
	@RequestMapping("/pm/read/{postMessageNo}")
	public ModelAndView read(@PathVariable Long postMessageNo) throws Exception{
		PostMessage postMessage = postMessageService.read(postMessageNo);
		ModelAndView mv = new ModelAndView("pm/pmRead", "postMessage", postMessage);
		return mv;
	}
}
