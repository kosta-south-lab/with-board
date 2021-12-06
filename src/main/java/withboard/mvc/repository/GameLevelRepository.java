package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Favorites;
import withboard.mvc.domain.GameLevel;

public interface GameLevelRepository extends JpaRepository<GameLevel, Long> {

	
	/**
	 * 즐겨찾기 검색
	 * */
	@Query(value = "select * from game_level where game_no = ? and member_no = ?", nativeQuery = true)
	@Modifying // DDL 또는 DML문장
	GameLevel selectLevel(Long gameNo, Long memberNo);
}
