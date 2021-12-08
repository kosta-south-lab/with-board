package withboard.mvc.service;

import java.util.List;

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
	
	Page<Game> searchByName(String keyword, Pageable pageable);
	
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

//관리자 Only (Admin)
/////////////////////////////////////////
	
	/**
	 * 보드게임 등록
	 */
	
	void insertGame(Game game, List<String> filenameList);
		
	/**
	 * 보드게임 수정 
	 */
	
	Game updateGame(Game game, List<String> filenameList);
	
	/**
	 * 보드게임 삭제
	 */
	
	void deleteGame(Long gameNo);	
	
	
}
