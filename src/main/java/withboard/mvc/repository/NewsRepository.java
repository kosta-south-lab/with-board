package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.News;

public interface NewsRepository extends JpaRepository<News, Long> {
	/**
	 * 검색조건이 title일 경우
	 */
	List<News> findByTitleContaining(String title);
	
	/**
	 * 검색조건이 member일 경우
	 */
	List<News> findByMember(Member member);
}
