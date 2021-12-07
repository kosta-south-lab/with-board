package withboard.mvc.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.GameComment;
import withboard.mvc.domain.GameLevel;
import withboard.mvc.domain.GameRating;
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
	
	private final GameCommentService gameCommentSerivce;
	
	

	/**
	 * 전체 검색
	 */
	
	@RequestMapping("/gameList")
	public void gameList(Model model ,@RequestParam(defaultValue = "1") int nowPage, 
							@RequestParam(value = "sortType", defaultValue="gameNo") String sortType) {
		
		Pageable pageable = PageRequest.of((nowPage - 1), 10, Sort.by(sortType));
		
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
	public void searchGame(Model model ,@RequestParam(defaultValue = "1") int nowPage, @RequestParam(value = "sortType", defaultValue="gameNo") String sortType) {
				
		Pageable pageable = PageRequest.of((nowPage - 1), 10, Sort.by(sortType));
				
		Page<Game> gameList = gameService.searchByName(pageable);
		
		model.addAttribute("gameList", gameList);
		
		int blockCount = 3;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		
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
	public String insertGame(Game game) {
		
		// 상세 내용에 특수문자, 스크립트 태그등 방지 하기 위한 코드 필요
		//board.getContent().replace("<", "&lt;");
		
		gameService.insertGame(game);
		
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
	public ModelAndView updateGame(Game dbGame) {
		
		Game game = gameService.updateGame(dbGame);
		
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
	public String insertComment(GameComment gameComment) {
		
		gameCommentSerivce.insertComment(gameComment);
		
		return "redirect:/game/readGame/" + gameComment.getGame().getGameNo();
	}
	
	/**
	 * 한줄평 삭제 (어드민)
	 */
	
	@RequestMapping("/deleteComment")
	public String deleteComment(GameComment gameComment) {
		
		gameCommentSerivce.deleteComment(gameComment);
		
		return "redirect:/game/readGame/" + gameComment.getGame().getGameNo();
	}
	
	/**
	 * 보드게임 평점 부여
	 */
	
	@RequestMapping("/insertRating")
	public String insertRating(Long gameNo, Long memberNo, int gameRating) {
		
		gameRatingService.insertRating(gameNo, memberNo, gameRating);
		
		return "redirect:/game/readGame/" + gameNo;
	}

	/**
	 * 보드게임 난이도 부여
	 */
	@RequestMapping("/insertLevel")
	public String insertLevel(Long gameNo, Long memberNo) {
		
		return "redirect:/game/readGame/" + gameNo;
	}
	
	
}
