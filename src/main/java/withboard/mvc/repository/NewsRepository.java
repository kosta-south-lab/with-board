package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.News;

public interface NewsRepository extends JpaRepository<News, Long> {
	/**
	 * 검색조건이 title일 경우
	 */
	Page<News> findByTitleContaining(String title, Pageable pageable);
	
	/**
	 * 검색조건이 member일 경우
	 */
	Page<News> findByMember(Member member, Pageable pageable);
}
