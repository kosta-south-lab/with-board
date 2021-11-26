package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.GameTheme;

public interface GameThemeRepository extends JpaRepository<GameTheme, Long> {

}
