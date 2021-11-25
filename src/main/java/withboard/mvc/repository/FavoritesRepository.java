package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Favorites;

public interface FavoritesRepository extends JpaRepository<Favorites, Long> {

}
