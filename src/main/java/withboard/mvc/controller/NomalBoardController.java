package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import withboard.mvc.service.BoardServiceImpl;
import withboard.mvc.service.BoardService;
import withboard.mvc.domain.*;

@Controller
@RequiredArgsConstructor

public class NomalBoardController {
	
	private final BoardService service;	
	
	@RequestMapping("/board/normalBoard")
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Board> postList = service.selectAll();
			
		
			request.setAttribute("postList", postList);
			System.out.println(postList);
			
		return new ModelAndView("board/normalBoard");
	}

}
