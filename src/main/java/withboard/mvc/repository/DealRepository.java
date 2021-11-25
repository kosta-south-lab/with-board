package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Deal;

public interface DealRepository extends JpaRepository<Deal, Long> {

}
