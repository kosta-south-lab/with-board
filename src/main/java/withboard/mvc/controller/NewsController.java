package withboard.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.News;
import withboard.mvc.service.NewsService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/news")
public class NewsController {
	
	private final NewsService newsService;
	
	/**
	 * 전체검색하기
	 * */
	@RequestMapping("/newsList")
	public ModelAndView list(String searchOption, String keyword) {
		
		if(searchOption == null) {
			searchOption = "title";
		}
		if(keyword == null) {
			keyword = "";
		}
		
		List<News> newsList=newsService.selectAll(searchOption, keyword);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/news/newsList");          
		mv.addObject("newsList", newsList);
		return mv;
				
		
	}
	
	/**
	 * 등록폼 
	 * */
	@RequestMapping("/registerForm")
	public ModelAndView writeForm() {
		return new ModelAndView("board/news/newsRegister");
	}
	
	/**
	 * 등록하기
	 * */
	@RequestMapping("/insert")
    public String insert(News news) {

		news.getContent().replace("<", "&lt;");
		newsService.insert(news);
		
		return "redirect:/board/news/newsList";
	}
	
	/**
	 * 상세보기
	 * */
	@RequestMapping("/read/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo , String flag) {
		
		boolean state = flag==null ? true : false;
		News news = newsService.selectBy(boardNo, state);//true는 조회수증가!!!
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("board/news/newsRead");
		mv.addObject("news", news);
		return mv;
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm/{boardNo}")
	public ModelAndView updateForm(@PathVariable Long boardNo) {
		News news = newsService.selectBy(boardNo, false);//조회수 증가안됨.
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/news/updateForm");
		mv.addObject("news", news);
		
		 return mv;
	}
	
	/**
	 * 수정완료
	 * */
	@RequestMapping("/update")
	public String update(News news) {
		News n = newsService.update(news);
		
		return "redirect:/board/news/read/" + n.getBoardNo() + "?flag=1";
		
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/delete/{boardNo}")
	public String delete(@PathVariable Long boardNo) {
		newsService.delete(boardNo);
		 
		 return "redirect:/board/news/newsList";
		 
	}
}