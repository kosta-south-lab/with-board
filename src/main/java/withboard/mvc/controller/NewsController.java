package withboard.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.News;
import withboard.mvc.service.NewsService;

@Controller
@RequiredArgsConstructor
public class NewsController {
	
	private final NewsService newsService;
	
	@RequestMapping("/board/news")
	public ModelAndView selectAll() {
		List<News> newsList = newsService.selectAll();
		
		System.out.println("여기부터" + newsList);
		
		ModelAndView mv = new ModelAndView("board/news/newsList", "newsList", newsList);
		return mv;
	}
}
