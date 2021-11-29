package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.repository.GameRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class GameServiceImpl implements GameService {

	
	private final GameRepository gameRepository;
	
	
	// 검색 결과 - 페이징 처리
	
	@Override
	public Page<Game> selectAll(Pageable pageable, String filterType) {
		
		return gameRepository.findAll(pageable);
	}

	
	
	// 보드게임 제목 키워드로 검색
	
	public Page<Game> searchByName(Pageable pageable){
		
		return gameRepository.findBygameNameLike();
	}
	
	// 상세 보드게임 조회
	
	@Override
	public Game selectBy(Long gameNo) {
		
		return gameRepository.findById(gameNo).orElse(null);
	}

	
	// 보드게임 평점 부여
	
	@Override
	public void insertRating(int rating) {
		// TODO Auto-generated method stub
		
	}
	
	
	//보드게임 난이도 부여

	@Override
	public void insertDifficulty(int difficulty) {
		// TODO Auto-generated method stub
		
	}
	
	//보드게임 한줄평 작성

	@Override
	public void insertComment(String comment) {
		// TODO Auto-generated method stub
		
	}
	
	//보드게임 등록

	@Override
	public void insertGame(Game game) {
			
		Game addGame = gameRepository.save(game);		
		if(addGame == null) throw new RuntimeException("데이터 오류로 인해 등록에 실패하였습니다.");
		
	}

	//보드게임 수정
	
	@Override
	public Game updateGame(Game game) {
		
		Game dbGame = gameRepository.findById(game.getGameNo()).orElse(null);
		if(dbGame==null) throw new RuntimeException("해당 보드게임은 존재하지 않습니다.");
		
		//정보 수정
		
		dbGame.setGameName(game.getGameName());
		dbGame.setPlayPersonnelMax(game.getPlayPersonnelMax());
		dbGame.setPlayPersonnelMin(game.getPlayPersonnelMin());
		dbGame.setGamePlaytimeMax(game.getGamePlaytimeMax());
		dbGame.setGamePlaytimeMin(game.getGamePlaytimeMin());
		dbGame.setAge(game.getAge());
		dbGame.setVideoUrl(game.getVideoUrl());
		dbGame.setGameProcess(game.getGameProcess());
		dbGame.setGameTheme(game.getGameTheme());
		dbGame.setGameCategory(game.getGameCategory());
		
		return dbGame;
	}
	
	
	//보드게임 삭제

	@Override
	public void deleteGame(Long gameNo) {
		
		Game dbGame = gameRepository.findById(gameNo).orElse(null);
		if(dbGame==null) throw new RuntimeException("보드게임 번호 오류로 삭제 할 수 없습니다.");
		
		gameRepository.delete(dbGame);
	}

}
