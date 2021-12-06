package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.GameLevel;
import withboard.mvc.repository.GameLevelRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class GameLevelServiceImpl implements GameLevelService {

	private final GameLevelRepository gameLevelRepository;
	
	@Override
	public GameLevel selectBy(Long gameNo, Long memberNo) {
		
		GameLevel dbGameLevel = gameLevelRepository.selectLevel(gameNo, memberNo);
		
		return dbGameLevel;
	}

	@Override
	public void insertLevel(GameLevel gameLevel) {
		
		
		GameLevel dbGameLevel = selectBy(gameLevel.getGame().getGameNo(), gameLevel.getMember().getMemberNo());
		
		if(dbGameLevel==null) {
			gameLevelRepository.save(gameLevel);
		}else {
			throw new RuntimeException("이미 난이도 평가를 하셨습니다!");
		}	
		
	}

}
