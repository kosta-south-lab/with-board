package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.MatchBoard;

public interface MatchBoardRepository extends JpaRepository<MatchBoard, Long> {

}
