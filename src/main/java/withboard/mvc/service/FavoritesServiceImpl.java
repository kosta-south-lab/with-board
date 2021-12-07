package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Favorites;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.FavoritesRepository;
import withboard.mvc.repository.GameRepository;
import withboard.mvc.repository.MemberRepository;


@Service
@RequiredArgsConstructor
@Transactional
public class FavoritesServiceImpl implements FavoritesService {

	private final FavoritesRepository favoritesRepository;
	
	private final MemberRepository memberRepository;
	
	private final GameRepository gameRepository;
	
	
	@Override
	public Favorites selectBy(Long gameNo, Long memberNo) {
		
		Favorites dbFavorites = favoritesRepository.selectFavorites(gameNo, memberNo);
		
		return dbFavorites;
	}

	@Override
	public void insertFavorites(Long gameNo, Long memberNo) {
				
		Favorites dbFavorites = selectBy(gameNo, memberNo);
				
		if(dbFavorites==null) {
			
			Member member = memberRepository.getById(memberNo);
			
			Game game = gameRepository.getById(gameNo);
			
			Favorites favorites = new Favorites(null, member, game);
			
			favoritesRepository.save(favorites);
		}else {
			throw new RuntimeException("이미 즐겨찾기 추가 한 게임입니다!");
		}				
	}

	@Override
	public void deleteFavorites(Long gameNo, Long memberNo) {		
		
		Favorites dbFavorites = selectBy(gameNo, memberNo);
		
		if(dbFavorites!=null) {
			favoritesRepository.delete(dbFavorites);
		}else {
			throw new RuntimeException("즐겨찾기 추가가 되지 않은 게임입니다!");
		}	
	}

}
