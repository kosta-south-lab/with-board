package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {
	
}
