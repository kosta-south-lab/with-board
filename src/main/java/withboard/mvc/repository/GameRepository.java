package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Game;


public interface GameRepository extends JpaRepository<Game, Long> {

}
