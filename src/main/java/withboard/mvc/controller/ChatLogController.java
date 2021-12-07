package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.ChatLog;
import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;
import withboard.mvc.service.ChatLogService;
import withboard.mvc.service.JoinMatchService;

@Controller
@RequiredArgsConstructor
public class ChatLogController {
	
private final ChatLogService chatLogService;
	
	@RequestMapping("chat/chatLogList")
	public ModelAndView list(Long joinMatchNo) {
		List<ChatLog> chatLogList = chatLogService.chatLogList(joinMatchNo);
		return new ModelAndView("/chat/chatLogList", "chatLogList", chatLogList);
	}
	@RequestMapping("chat/insert")
	public String insert(ChatLog chatLog, HttpServletRequest request,HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		
		chatLog.setMember(member);
		String nickname = member.getId();
		chatLog.setNickname(nickname);
		System.out.println(chatLog.getChatLogContent());
		System.out.println(chatLog.getJoinMatchNo());
		chatLogService.insert(chatLog);
		 String referer = request.getHeader("Referer");
		 return "redirect:"+ referer;
	}
	
	

}
