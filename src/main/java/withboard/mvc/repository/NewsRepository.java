package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.News;

public interface NewsRepository extends JpaRepository<News, Long> {

}
