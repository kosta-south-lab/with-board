package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.GameCategory;

public interface GameCategoryRepository extends JpaRepository<GameCategory, Long> {

}
