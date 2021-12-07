package withboard.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.Image;
import withboard.mvc.repository.GameRepository;
import withboard.mvc.repository.ImageRepository;

@Service
@RequiredArgsConstructor
@Transactional
public class GameServiceImpl implements GameService {

	
	private final GameRepository gameRepository;
	private final ImageRepository imageRepository;
	
	
	// 검색 결과 - 페이징 처리
	
	@Override
	public Page<Game> selectAll(Pageable pageable) {
		
		return gameRepository.findAll(pageable);
	}
	
	// 보드게임 제목 키워드로 검색
	
	public Page<Game> searchByName(Pageable pageable){
		
		return null; //gameRepository.findBygameNameLike();
	}
	
	// 상세 보드게임 조회
	
	@Override
	public Game selectBy(Long gameNo) {
		
		return gameRepository.findById(gameNo).orElse(null);
	}
	
	//보드게임 등록

	@Override
	public void insertGame(Game game, List<String> filenameList) {
			
		gameRepository.save(game);		
		
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, null, game));
		}
	}

	//보드게임 수정
	
	@Override
	public Game updateGame(Game game, List<String> filenameList) {
		
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
		
		//이미지테이블에서 이미지이름 삭제
		List<Long> imageNoList = new ArrayList<Long>();
		for(Image image : dbGame.getImageList()) {
			imageNoList.add(image.getImageNo());
		}
		dbGame.setImageList(null);
		for(Long imageNo : imageNoList) {
			imageRepository.deleteById(imageNo);
		}
		
		//이미지테이블에 새로운 이미지 이름 저장
		for(String fname : filenameList) {
			imageRepository.save(new Image(null, fname, null, dbGame));
		}
		
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
