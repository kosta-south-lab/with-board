package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Favorites;
import withboard.mvc.repository.FavoritesRepository;


@Service
@RequiredArgsConstructor
@Transactional
public class FavoritesServiceImpl implements FavoritesService {

	private final FavoritesRepository favoritesRepository;
	
	
	@Override
	public Favorites selectBy(Long gameNo, Long memberNo) {
		
		Favorites dbFavorites = favoritesRepository.selectFavorites(gameNo, memberNo);
		
		return dbFavorites;
	}

	@Override
	public void insertFavorites(Favorites favorites) {
				
		Favorites dbFavorites = selectBy(favorites.getGame().getGameNo(), favorites.getMember().getMemberNo());
				
		if(dbFavorites==null) {
			favoritesRepository.save(favorites);
		}else {
			throw new RuntimeException("이미 즐겨찾기 추가 한 게임입니다!");
		}				
	}

	@Override
	public void deleteFavorites(Favorites favorites) {		
		
		Favorites dbFavorites = selectBy(favorites.getGame().getGameNo(), favorites.getMember().getMemberNo());
		
		if(dbFavorites!=null) {
			favoritesRepository.delete(favorites);
		}else {
			throw new RuntimeException("즐겨찾기 추가가 되지 않은 게임입니다!");
		}	
	}

}
