package withboard.mvc.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import withboard.mvc.domain.Game;

public interface GameService {

	
//공용 부분 (Guest, User, Admin)	
////////////////////////////////////////	
	
	/**
	 * 검색 결과 - 페이징 처리
	 */
	
	Page<Game> selectAll(Pageable pageable);
	
	
	/**
	 * 보드게임 제목 키워드로 검색
	 */
	
	Page<Game> searchByName(Pageable pageable);
	
	/**
	 * 상세 보드게임 조회
	 */
	
	Game selectBy(Long gameNo);
	
	/**
	 * 검색 결과 정렬
	 */
	
	/**
	 * 검색 결과 필터
	 */
	
//공용 부분 (User, Admin)	
////////////////////////////////////////	
	
	/**
	 * 보드게임 평점 부여
	 */
	
	void insertRating(int rating);
	
	/**
	 * 보드게임 난이도 평가
	 */
	
	void insertDifficulty(int difficulty);
	
	/**
	 * 보드게임 한줄평 작성
	 */
	
	void insertComment(String comment);
	

//관리자 Only (Admin)
/////////////////////////////////////////
	
	/**
	 * 보드게임 등록
	 */
	
	void insertGame(Game game);
		
	/**
	 * 보드게임 수정 
	 */
	
	Game updateGame(Game game);
	
	/**
	 * 보드게임 삭제
	 */
	
	void deleteGame(Long gameNo);	
	
	
}
