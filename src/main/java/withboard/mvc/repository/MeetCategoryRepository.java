package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.MeetCategory;

public interface MeetCategoryRepository extends JpaRepository<MeetCategory, Long> {

}
