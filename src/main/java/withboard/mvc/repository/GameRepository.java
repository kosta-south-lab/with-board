package withboard.mvc.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Game;


public interface GameRepository extends JpaRepository<Game, Long> {

	/**
	 * 게임명의 일부로 게임 검색하기
	 */
	@Query("select from Game g where g.game_name like %?%")
	Page<Game> findBygameNameLike();

}
