package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.GameRating;
import withboard.mvc.repository.GameRatingRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class GameRatingServiceImpl implements GameRatingService {

	
	public final GameRatingRepository gameRatingRepository;
	
	@Override
	public GameRating selectBy(Long gameNo, Long memberNo) {

		GameRating dbGameRating = gameRatingRepository.selectRating(gameNo, memberNo);
		
		return dbGameRating;
	}

	@Override
	public void insertRating(GameRating gameRating) {

		GameRating dbGameRating = selectBy(gameRating.getGame().getGameNo(), gameRating.getMember().getMemberNo());
		
		if(dbGameRating==null) {
			gameRatingRepository.save(gameRating);
		}else {
			throw new RuntimeException("이미 평점 등록을 하셨습니다!");
		}	
		
		
	}

}
