package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Game;
import withboard.mvc.domain.Meet;
import withboard.mvc.domain.MeetCategory;
import withboard.mvc.domain.Member;


public interface GameRepository extends JpaRepository<Game, Long> {

//	/**
//	 * 게임명의 일부로 게임 검색하기
//	 */
//	@Query(value = "select * from Game where game_name like %?%", nativeQuery = true)
//	List<Game> findBygameNameLike(String keyword);
	
	
	//List<Game> findByMeetCategoryAndMember(String keyword);
	
	Page<Game> findByGameNameContaining(String keyword, Pageable pageable);
	
	
	@Query(value = "select * from Game where game_category_no = ?", nativeQuery = true)
	Page<Game> findByGameCategoryNo(int categoryNo, Pageable pageable);
	
	
	//@Query(value = "select image_url, game_no, game_name from game natural join image natural join game_comment order by comment_date desc")
	//List<Object> selectGameByCommentDate();

}
