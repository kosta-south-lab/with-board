package withboard.mvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView list(String searchOption, String keyword,
			@RequestParam(defaultValue = "1") int nowPage, 
			@RequestParam(value = "sortType", defaultValue="boardNo") String sortType) {
		
		if(searchOption == null) {
			searchOption = "title";
		}
		if(keyword == null) {
			keyword = "";
		}
		
		Pageable pageable = PageRequest.of((nowPage - 1), 9, Sort.by(sortType).descending());
		
		int blockCount = 3;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		Page<News> newsList=newsService.selectAll(searchOption, keyword,pageable);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/news/newsList");          
		mv.addObject("newsList", newsList);
		mv.addObject("blockCount", blockCount);
	    mv.addObject("nowPage", nowPage);
	    mv.addObject("startPage", startPage);
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
    public String insert(News news, List<MultipartFile> filename, HttpSession session) {

		//파일 저장
				String path = session.getServletContext().getRealPath("/resources/images/board");
				List<String> filenameList = new ArrayList<String>();

				for(MultipartFile file : filename) {
					
					String originalFileName = file.getOriginalFilename();
					
					//파일이 들어오지 않아도 파일 1개가 ""로 들어오게된다. 그 경우 걸러내는 작업
					if(originalFileName == "") {
						break;
					}
					
					String newFileName = this.changeFileName(originalFileName);
					File newFile = new File(path + "/" + newFileName);
					filenameList.add("/resources/images/board/" + newFileName);
					try {				
						file.transferTo(newFile);
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
		news.getContent().replace("<", "&lt;");
		newsService.insert(news, filenameList);
		
		return "redirect:/board/news/newsList";
	}
	
	/**
	 * 파일이름 랜덤생성
	 * */
	private String changeFileName(String originalName){
		//uuid 생성
		UUID uuid = UUID.randomUUID();
		//랜덤생성 + 파일이름
		String savedName = uuid.toString() + "_" + originalName;		
		return savedName;
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
	public String update(News news, List<MultipartFile> filename, HttpSession session) {
		
		//파일 저장
		String path = session.getServletContext().getRealPath("/resources/images/board");
		List<String> filenameList = new ArrayList<String>();
		
		for(MultipartFile file : filename) {
			System.out.println(file.getOriginalFilename());
			
			String originalFileName = file.getOriginalFilename();
			String newFileName = this.changeFileName(originalFileName);
			
			File newFile = new File(path + "/" + newFileName);
			
			filenameList.add("/resources/images/board/" + newFileName);
			try {				
				file.transferTo(newFile);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		newsService.update(news, filenameList);
		
		return "redirect:/board/news/read/" + news.getBoardNo() + "?flag=1";
		
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