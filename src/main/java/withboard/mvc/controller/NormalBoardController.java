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
import withboard.mvc.domain.Normal;
import withboard.mvc.service.NormalBoardService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/normal")
public class NormalBoardController {
	
	private final NormalBoardService normalBoardService;
	
	/**
	 * 전체검색하기
	 * */
	@RequestMapping("/normalList")
	public ModelAndView list(Long normalCategoryNo, String searchOption, String keyword) {
		
		if(normalCategoryNo == null) {
			normalCategoryNo = 1L;
		}
		if(searchOption == null) {
			searchOption = "title";
		}
		if(keyword == null) {
			keyword = "";
		}
		
		List<Normal> normalList = normalBoardService.selectAll(normalCategoryNo, searchOption, keyword);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/normal/normalList");          //
		mv.addObject("normalList", normalList);
		mv.addObject("normalCategoryNo", normalCategoryNo);
		return mv;
	}
	
	/**
	 * 등록폼 
	 * */
	@RequestMapping("/registerForm")
	public ModelAndView writeForm() {
		return new ModelAndView("board/normal/normalRegister");
	}
	
	/**
	 * 등록하기
	 * */
	@RequestMapping("/insert")
    public String insert(Normal normal, Long normalCategoryNo, List<MultipartFile> filename, HttpSession session) {
		
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
		normal.getContent().replace("<", "&lt;");
		normalBoardService.insert(normal,normalCategoryNo, filenameList);
		
		return "redirect:/board/normal/normalList";
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
		Normal normal = normalBoardService.selectBy(boardNo, state);//true는 조회수증가!!!
		
		ModelAndView mv =new ModelAndView();
		mv.setViewName("board/normal/normalRead");
		mv.addObject("normal", normal);
		return mv;
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm/{boardNo}")
	public ModelAndView updateForm(@PathVariable Long boardNo) {
		Normal normal = normalBoardService.selectBy(boardNo, false);//조회수 증가안됨.
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/normal/updateForm");
		mv.addObject("normal", normal);
		
		 return mv;
	}
	
	/**
	 * 수정완료
	 * */
	@RequestMapping("/update")
	public String update(Normal normal, Long normalCategoryNo, List<MultipartFile> filename, HttpSession session) {
		
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
		
		normalBoardService.update(normal,normalCategoryNo, filenameList);
		
		return "redirect:/board/normal/read/" + normal.getBoardNo() + "?flag=1";
		
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/delete/{boardNo}")
	public String delete(@PathVariable Long boardNo) {
		normalBoardService.delete(boardNo);
		 
		 return "redirect:/board/normal/normalList";
		 
	}


}
