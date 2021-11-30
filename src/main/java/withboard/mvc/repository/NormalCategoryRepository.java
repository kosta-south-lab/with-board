package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Normal;
import withboard.mvc.domain.NormalCategory;

public interface NormalCategoryRepository extends JpaRepository<NormalCategory, Long> {

}
