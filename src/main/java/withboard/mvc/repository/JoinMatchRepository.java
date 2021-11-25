package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.JoinMatch;

public interface JoinMatchRepository extends JpaRepository<JoinMatch, Long> {

}
