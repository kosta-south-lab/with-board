package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Game;


public interface GameRepository extends JpaRepository<Game, Long> {

	/**
	 * 게임명의 일부로 게임 검색하기
	 */
	@Query(value = "select * from Game where game_name like '%?1%'", nativeQuery = true)
	List<Game> findBygameNameLike(String keyword);

}
