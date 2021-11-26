package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Meet;

public interface MeetRepository extends JpaRepository<Meet, Long> {

}
