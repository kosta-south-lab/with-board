package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Favorites;

public interface FavoritesRepository extends JpaRepository<Favorites, Long> {

	
	/**
	 * 즐겨찾기 검색
	 * */
	@Query(value = "select * from favorites f where f.game_no = ? and f.member_no = ?", nativeQuery = true)
	@Modifying // DDL 또는 DML문장
	Favorites selectFavorites(Long gameNo, Long memberNo);
	
	
	
}
