package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {
	
	/***
	 * 조회수 증가(JPQL 문법)
	 */
	@Query("update Board b set b.viewCount=b.viewCount+1 where b.boardNo=?1")
	@Modifying //DDL 또는 DML 문장
	int viewCountUpdate(Long boardNo);

}
