package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.controller.ModelAndView;
import kosta.mvc.dto.Post;
import kosta.mvc.service.PostReplyService;
import kosta.mvc.service.PostReplyServiceImpl;
import kosta.mvc.service.PostService;
import kosta.mvc.service.PostServicelmpl;

public class NomalBoardController {
	
private PostService service = new PostServicelmpl();
	
	private PostReplyService postReplyService = new PostReplyServiceImpl();

	private String getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String) session.getAttribute("userId");
	}

	
	
	public ModelAndView postSelectAllPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Post> postList = service.selectAllPost();
			
		
			request.setAttribute("postList", postList);
			
		return new ModelAndView("board/freeBoardWrite.jsp");
	}

}
