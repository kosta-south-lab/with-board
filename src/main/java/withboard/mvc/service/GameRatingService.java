package withboard.mvc.service;

import withboard.mvc.domain.GameRating;

public interface GameRatingService {
	
	public GameRating selectBy(Long gameNo, Long memberNo);
	
	public void insertRating(Long gameNo, Long memberNo, int gameRating);

}
