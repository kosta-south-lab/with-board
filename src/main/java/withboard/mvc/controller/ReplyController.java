package withboard.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Reply;
import withboard.mvc.service.ReplyService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/reply")
public class ReplyController {
	
	private final ReplyService replyService;
	
	@RequestMapping("/insert")
	public String insert(Reply reply, Long boardNo, String boardType) {
		
		replyService.insert(reply, boardNo);
		
		return "redirect:/board/" + boardType + "/read/" + boardNo + "?flag=1";
	}
	
	@RequestMapping("/delete/{replyNo}")
	public String delete(@PathVariable Long replyNo, Long boardNo, String boardType) {
		
		replyService.delete(replyNo);
		
		return "redirect:/board/" + boardType + "/read/" + boardNo + "?flag=1";
	}
}
