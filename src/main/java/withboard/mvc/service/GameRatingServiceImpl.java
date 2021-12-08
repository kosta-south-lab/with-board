package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.GameRating;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.GameRatingRepository;
import withboard.mvc.repository.GameRepository;
import withboard.mvc.repository.MemberRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class GameRatingServiceImpl implements GameRatingService {

	
	public final GameRatingRepository gameRatingRepository;
	
	public final GameRepository gameRepository;
	
	public final MemberRepository memberRepository;
	
	@Override
	public GameRating selectBy(Long gameNo, Long memberNo) {

		GameRating dbGameRating = gameRatingRepository.selectRating(gameNo, memberNo);
		
		return dbGameRating;
	}

	@Override
	public void insertRating(GameRating gameRating) {

		//GameRating dbGameRating = selectBy(gameNo, memberNo);
		
		//if(dbGameRating==null) {
			
		//Game game = gameRepository.getById(gameNo);
			
		//Member member = memberRepository.getById(memberNo);
			
		//	GameRating gr = new GameRating(null, game, member, score);
			
			gameRatingRepository.save(gameRating);
		//}else {
		//	throw new RuntimeException("이미 평점 등록을 하셨습니다!");
		//}	
		
		
	}

}
