package withboard.mvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Meet;
import withboard.mvc.service.MeetBoardService;
import withboard.mvc.service.MeetBoardServiceImpl;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class MeetBoardController {
	
	private final MeetBoardService meetBoardService;
	
	/**
	 * 모임 목록 페이지
	 * */
	@RequestMapping("/meet")
	public ModelAndView selectAll(Long meetCategoryNo, String searchOption, String keyword) {
		
		if(meetCategoryNo == null) {
			meetCategoryNo = 1L;
		}
		if(searchOption == null) {
			searchOption = "title";
		}
		if(keyword == null) {
			keyword = "";
		}
		
		List<Meet> meetList = meetBoardService.selectAll(meetCategoryNo, searchOption, keyword);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/meet/meetList");
		mv.addObject("meetList", meetList);
		mv.addObject("meetCategoryNo", meetCategoryNo);
		return mv;
	}
	
	/**
	 * 모임 등록 폼
	 * */
	@RequestMapping("/meet/registerForm")
	public ModelAndView writeForm() {
		return new ModelAndView("board/meet/meetRegister");
	}
	
	/**
	 * 모임 등록
	 * */
	@RequestMapping("/meet/insert")
	public String insert(Meet meet, Long meetCategoryNo, List<MultipartFile> filename, HttpSession session) {
		
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
		
		meetBoardService.insert(meet, meetCategoryNo, filenameList);
		
		
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
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/meet/updateForm");
		mv.addObject("meet", meet);
	
		return mv;
		
	}
	
	/**
	 * update
	 * */
	@RequestMapping("/meet/update")
	public String update(Meet meet, Long meetCategoryNo, List<MultipartFile> filename, HttpSession session) {
		
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
		
		meetBoardService.update(meet, meetCategoryNo, filenameList);

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

	
}
