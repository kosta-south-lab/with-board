package withboard.mvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.Meet;
import withboard.mvc.domain.Member;
import withboard.mvc.service.MeetBoardService;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class MeetBoardController {
	
	private final MeetBoardService meetBoardService;
	
	/**
	 * 모임 목록 페이지
	 * */
	@RequestMapping("/meet")
	public ModelAndView selectAll(Long meetCategoryNo, String searchOption, String keyword, @RequestParam(defaultValue = "1") int nowPage) {
		
		if(meetCategoryNo == null) {
			meetCategoryNo = 1L;
		}
		if(searchOption == null) {
			searchOption = "title";
		}
		if(keyword == null) {
			keyword = "";
		}
		
		Pageable pageable = PageRequest.of(nowPage-1, 9, Direction.DESC, "boardNo");
		
		Page<Meet> meetList = meetBoardService.selectAllPaging(meetCategoryNo, searchOption, keyword, pageable);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/meet/meetList");
		mv.addObject("meetList", meetList);
		mv.addObject("meetCategoryNo", meetCategoryNo);
		mv.addObject("searchOption", searchOption);
		mv.addObject("keyword", keyword);
		
		//페이징 관련해서 requestScope에 담아야하는 값
		int blockCount = 3;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
	    mv.addObject("blockCount", blockCount);
	    mv.addObject("nowPage", nowPage);
	    mv.addObject("startPage", startPage);
		
		return mv;
	}
	
	/**
	 * 모임 등록 폼
	 * */
	@RequestMapping("/meet/registerForm")
	public ModelAndView writeForm() {
		
		List<Game> gameList = meetBoardService.selectAllGame();
		return new ModelAndView("board/meet/meetRegister", "gameList", gameList);
	}
	
	/**
	 * 모임 등록
	 * */
	@RequestMapping("/meet/insert")
	public String insert(Meet meet, Long meetCategoryNo, Long gameNo, List<MultipartFile> filename, HttpSession session) {
		
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
		
		Member member = (Member) session.getAttribute("member");
		System.out.println(member.getId());
		System.out.println(member.getName());
		System.out.println(member.getNickname());
		System.out.println(member.getEmail());
		System.out.println(member.getLocation2());
		meetBoardService.insert(meet, meetCategoryNo, gameNo, filenameList, member);
		
		
		return "redirect:/board/meet";
		
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
	 * 모임 상세 page
	 * */
	@RequestMapping("/meet/read/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo, String flag) {
		
		boolean state = flag == null ? true : false;
		Meet meet = meetBoardService.selectByBoardNo(boardNo, state);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/meet/meetRead");
		mv.addObject("meet", meet);
	
		return mv;
		
	}
	
	/**
	 * updateForm
	 * */
	@RequestMapping("/meet/updateForm/{boardNo}")
	public ModelAndView updateForm(@PathVariable Long boardNo) {
		
		Meet meet = meetBoardService.selectByBoardNo(boardNo, false);
		List<Game> gameList = meetBoardService.selectAllGame();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/meet/updateForm");
		mv.addObject("meet", meet);
		mv.addObject("gameList", gameList);
	
		return mv;
		
	}
	
	/**
	 * update
	 * */
	@RequestMapping("/meet/update")
	public String update(Meet meet, Long meetCategoryNo, Long gameNo, List<MultipartFile> filename, HttpSession session) {
		
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
		
		meetBoardService.update(meet, meetCategoryNo, gameNo, filenameList);

		return "redirect:/board/meet/read/" + meet.getBoardNo() + "?flag=1";
	}
	
	/**
	 * delete
	 */
	@RequestMapping("/meet/delete/{boardNo}")
	public String delete(@PathVariable Long boardNo) {
		meetBoardService.delete(boardNo);
		return "redirect:/board/meet";
	}
	
	//sample
	@RequestMapping("/meet/meetList2")
	public void meetList2() {}
	
}
