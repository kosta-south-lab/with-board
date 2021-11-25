package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.GameProcess;

public interface GameProcessRepository extends JpaRepository<GameProcess, Long> {

}
