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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.GameComment;
import withboard.mvc.domain.GameLevel;
import withboard.mvc.domain.GameRating;
import withboard.mvc.domain.Member;
import withboard.mvc.service.GameCommentService;
import withboard.mvc.service.GameLevelService;
import withboard.mvc.service.GameRatingService;
import withboard.mvc.service.GameService;

@Controller
@RequestMapping("/game")
@RequiredArgsConstructor
public class GameController {
	
	
	private final GameService gameService;
		
	private final GameRatingService gameRatingService;
	
	private final GameLevelService gameLevelService;
	
	private final GameCommentService gameCommentService;
	
	

	/**
	 * 전체 검색
	 */
	
	@RequestMapping("/gameList")
	public void gameList(Model model ,@RequestParam(defaultValue = "1") int nowPage, 
							@RequestParam(value = "sortType", defaultValue="gameNo") String sortType) {
		
		Pageable pageable = PageRequest.of((nowPage - 1), 9, Sort.by(sortType).descending());
		
		Page<Game> gameList = gameService.selectAll(pageable);
		
		model.addAttribute("gameList", gameList);
		
		int blockCount = 3;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
	}
	
	/**
	 * 보드게임 제목 키워드 검색
	 */
	
	@RequestMapping("/searchGameList")
	public void searchGame(Model model , @RequestParam(value = "keyword", defaultValue = "") String keyword) {
				
		
		System.out.println("내가 받은 키워드 : " + keyword);
		
		List<Game> gameList = gameService.searchByName(keyword);
		
		model.addAttribute("gameList", gameList);
		
		System.out.println("내가 받은 게임리스트 : " + gameList);
			
	}
	
	
	/**
	 * 상세 페이지 보기
	 */
	
	@RequestMapping("/readGame/{gameNo}")
	public ModelAndView readGame(@PathVariable Long gameNo) {
		
		Game game = gameService.selectBy(gameNo);
		
		ModelAndView mv = new ModelAndView("game/readGame", "game", game);
		
		return mv;
	}
	
	
	/**
	 * 보드게임 등록 폼으로 이동
	 */
	@RequestMapping("/insertGameForm")
	public void insertGameForm() {
		
	}
	
	/**
	 * 보드게임 등록
	 */
	@RequestMapping("/insertGame")
	public String insertGame(Game game, List<MultipartFile> filename, HttpSession session) {
		
		
		//파일 저장
		String path = session.getServletContext().getRealPath("/resources/images/game");
		List<String> filenameList = new ArrayList<String>();

		for(MultipartFile file : filename) {
			
			String originalFileName = file.getOriginalFilename();
			
			//파일이 들어오지 않아도 파일 1개가 ""로 들어오게된다. 그 경우 걸러내는 작업
			if(originalFileName == "") {
				break;
			}
			
			String newFileName = this.changeFileName(originalFileName);
			File newFile = new File(path + "/" + newFileName);
			filenameList.add("/resources/images/game/" + newFileName);
			try {				
				file.transferTo(newFile);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
				
		game.getGameDetail().replace("<", "&lt;");

		gameService.insertGame(game, filenameList);
		
		return "redirect:/game/gameList";				
	}
	
	/**
	 * 보드게임 수정 폼으로 이동
	 */
	
	@RequestMapping("updateGameForm")
	public ModelAndView updateGameForm(Long gameNo) {
		
		Game game = gameService.selectBy(gameNo);
		
		ModelAndView mv = new ModelAndView("game/updateGame", "game", game);
		
		return mv;
	}
	
	/**
	 * 보드게임 수정
	 */
	
	@RequestMapping("/updateGame")
	public ModelAndView updateGame(Game dbGame, List<MultipartFile> filename, HttpSession session) {
		
		//파일 저장
		String path = session.getServletContext().getRealPath("/resources/images/game");
		List<String> filenameList = new ArrayList<String>();
		
		for(MultipartFile file : filename) {
			
			
			String originalFileName = file.getOriginalFilename();
			if(originalFileName == "") {
				break;
			}
			String newFileName = this.changeFileName(originalFileName);
			
			File newFile = new File(path + "/" + newFileName);
			
			filenameList.add("/resources/images/game/" + newFileName);
			try {				
				file.transferTo(newFile);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		Game game = gameService.updateGame(dbGame, filenameList);
		
		return new ModelAndView("game/readGame", "game", game);
	}
	
	
	/**
	 * 삭제하기
	 */
	
	@RequestMapping("/deleteGame")
	public String deleteGame(Long gameNo) {
		
		gameService.deleteGame(gameNo);
		
		return "redirect:/game/gameList";
		
	}
	
	/**
	 * 한줄평 입력
	 */
	
	@RequestMapping("/insertComment")
	public String insertComment(GameComment gameComment, Long gameNo, Long memberNo) {
				
		gameComment.setGame(Game.builder().gameNo(gameNo).build());
		gameComment.setMember(Member.builder().memberNo(memberNo).build());
		gameCommentService.insert(gameComment);
		
		return "redirect:/game/readGame/" + gameNo;
	}
	
	/**
	 * 한줄평 삭제 (어드민)
	 */
	
	@RequestMapping("/deleteComment/{commentNo}/{gameNo}")
	public String deleteComment(@PathVariable Long commentNo , @PathVariable Long gameNo) {
		
		gameCommentService.delete(commentNo);
		
		return "redirect:/game/readGame/" + gameNo;
	}
	
	/**
	 * 보드게임 평점 부여
	 */
	
	@RequestMapping("/insertRating")
	public String insertRating(GameRating gameRating) {
		
		gameRatingService.insertRating(gameRating);
		
		return "redirect:/game/readGame/" + "1";
	}

	/**
	 * 보드게임 난이도 부여
	 */
	@RequestMapping("/insertLevel")
	public String insertLevel(Long gameNo, Long memberNo) {
		
		return "redirect:/game/readGame/" + gameNo;
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
	
}
