package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Authorities;

public interface AuthoritiesRepository extends JpaRepository<Authorities, Long> {

}
