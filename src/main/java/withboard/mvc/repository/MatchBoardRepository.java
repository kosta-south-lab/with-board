package withboard.mvc.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import withboard.mvc.domain.MatchBoard;

public interface MatchBoardRepository extends JpaRepository<MatchBoard, Long> {
	



}
