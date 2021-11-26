package withboard.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.service.BoardServiceImpl;
import withboard.mvc.service.BoardService;
import withboard.mvc.domain.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class NomalBoardController {
	
	private final BoardService boardSerivce;
	
	/**
	 * 전체검색하기
	 * */
	@RequestMapping("/list")
	public void list(Model model ,@RequestParam(defaultValue = "1") int nowPage) {
		
		Pageable pageable = PageRequest.of((nowPage-1), 10, Direction.DESC, "bno");//
		Page<Board> pageList = boardSerivce.selectAll(pageable);
		
		model.addAttribute("pageList", pageList);//뷰쪽으로 전달될 데이터정보
		
		int blockCount=3;
		int temp= (nowPage-1)%blockCount;
		int startPage = nowPage-temp; 
		
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		
	}
	
	/**
	 * 등록폼 
	 * */
	@RequestMapping("/write")
	public void write() {}
	
	/**
	 * 등록하기
	 * */
	@RequestMapping("/insert")
    public String insert(Board board) {
		
		//등록전에 입력한 데이터에 유효하지  않는 특수문자, 스크립트태그등이 있으면 태그가 아닌 문자열로 변경한다.  - 실무에서 filter로 적용
		board.getContent().replace("<", "&lt;");
		
		boardSerivce.insert(board);
		
		return "redirect:/board/list";
	}
	
	/**
	 * 상세보기
	 * */
	@RequestMapping("/read/{bno}")
	public ModelAndView read(@PathVariable Long bno , String flag) {
		
		//boolean state = flag==null ? true : false;
		boolean state = flag==null ;
		
		Board board = boardSerivce.selectBy(bno, state);//true는 조회수증가!!!
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("board/read");
		mv.addObject("board", board);
		return mv;
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long bno) {
		 Board fb = boardSerivce.selectBy(bno, false);//조회수 증가안됨.
		
		 ModelAndView mv = new ModelAndView("board/update", "board", fb);
		 return mv;
	}
	
	/**
	 * 수정완료
	 * */
	@RequestMapping("/update")
	public ModelAndView update(Board board) {
	  Board dbBoard = boardSerivce.update(board);
		
		return new ModelAndView("board/read","board", dbBoard);
		
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long bno , String password) {
		boardSerivce.delete(bno, password);
		 
		 return "redirect:/board/list";
		 
	}


}
