package withboard.mvc.service;

import withboard.mvc.domain.GameLevel;

public interface GameLevelService {
	
	public GameLevel selectBy(Long gameNo, Long memberNo);
	
	public void insertLevel(GameLevel gameLevel);


}
