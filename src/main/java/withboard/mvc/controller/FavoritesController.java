package withboard.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Favorites;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.Member;
import withboard.mvc.service.FavoritesService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/favorites")
public class FavoritesController {

	private final FavoritesService favoritesService;
	
//	//즐겨찾기 검색
//	
//	@RequestMapping("/select")
//	public void selectFavorites(Long gameNo, Long memberNo) {
//		
//		Favorites favorites = favoritesService.selectBy(gameNo, memberNo);
//		
//		if(favorites==null) {
//			favoritesService.insertFavorites(favorites);
//		} else {
//			favoritesService.deleteFavorites(favorites);
//		}
//	}
	
	
	@RequestMapping("/insert")
	public String insertFavorites(Favorites favorites, Long gameNo, Long memberNo) {
		
		favorites.setGame(Game.builder().gameNo(gameNo).build());
		favorites.setMember(Member.builder().memberNo(memberNo).build());
		
		favoritesService.insertFavorites(favorites);
		
		return "redirect:/game/readGame/" + gameNo;
	}
	
	@RequestMapping("/delete")
	public String deleteFavorites(Long gameNo, Long memberNo) {
		
		favoritesService.deleteFavorites(gameNo, memberNo);
		
		return "redirect:/game/readGame/" + gameNo;
	}
	
}
