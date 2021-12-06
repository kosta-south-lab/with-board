package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.GameRating;

public interface GameRatingRepository extends JpaRepository<GameRating, Long> {
	
	/**
	 * 즐겨찾기 검색
	 * */
	@Query(value = "select * from game_rating where game_no = ? and member_no = ?", nativeQuery = true)
	@Modifying // DDL 또는 DML문장
	GameRating selectRating(Long gameNo, Long memberNo);

}
