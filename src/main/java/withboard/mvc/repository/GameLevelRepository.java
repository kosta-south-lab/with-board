package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.GameLevel;

public interface GameLevelRepository extends JpaRepository<GameLevel, Long> {

}
