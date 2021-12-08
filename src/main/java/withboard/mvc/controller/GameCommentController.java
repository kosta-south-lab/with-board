package withboard.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.GameComment;
import withboard.mvc.service.GameCommentService;

@Controller
@RequestMapping("/comment")
@RequiredArgsConstructor
public class GameCommentController {

	
	private final GameCommentService gameCommentService;
	
	/**
	 * 댓글 등록하기
	 * */
	@RequestMapping("/insert")
	public String insert(GameComment gameComment, Long gameNo) { // 내용 ,부모글번호 
		
		//부모글번호를 Reply에 세팅
		//reply.setFreeBoard( FreeBoard.builder().bno(bno).build() );
		
		//replyService.insert(reply);
		
		gameCommentService.insert(gameComment);
		
		
		//등록후에 부모글의 상세페이지로 이동!
		return "redirect:/game/readGame/" + gameNo;
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/delete/{commentNo}/{gameNo}")
	public String delete(@PathVariable Long commentNo , @PathVariable Long gameNo) {
		gameCommentService.delete(commentNo);
		
		return "redirect:/game/readGame/" + gameNo;
	}
	
	
}
