package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Member;
import withboard.mvc.domain.Normal;
import withboard.mvc.domain.NormalCategory;

public interface NormalRepository extends JpaRepository<Normal, Long> {

	
	List<Normal> findByNormalCategory(NormalCategory normalCategory);
	
	/**
	 * 검색조건이 title일 경우
	 */
	List<Normal> findByNormalCategoryAndTitleContaining(NormalCategory normalCategory, String title);
	
	/**
	 * 검색조건이 member일 경우
	 */
	List<Normal> findByNormalCategoryAndMember(NormalCategory normalCategory, Member member);

}
