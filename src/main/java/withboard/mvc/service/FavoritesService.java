package withboard.mvc.service;

import withboard.mvc.domain.Favorites;

public interface FavoritesService {

	public Favorites selectBy(Long gameNo, Long memberNo);
	
	public void insertFavorites(Long gameNo, Long memberNo);
	
	public void deleteFavorites(Long gameNo, Long memberNo);
	
}
