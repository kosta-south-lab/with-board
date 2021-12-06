package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.GameComment;

public interface GameCommentRepository  extends JpaRepository<GameComment, Long> {
	
	
	@Query(value = "select * from game_comment where game_no = ? and member_no = ?", nativeQuery = true)
	@Modifying // DDL 또는 DML문장
	GameComment selectComment(Long gameNo, Long memberNo);

}
