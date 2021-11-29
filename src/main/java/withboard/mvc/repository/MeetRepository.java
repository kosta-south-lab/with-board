package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Meet;
import withboard.mvc.domain.MeetCategory;
import withboard.mvc.domain.Member;

public interface MeetRepository extends JpaRepository<Meet, Long> {
	
	List<Meet> findByMeetCategory(MeetCategory meetCategory);
	
	/**
	 * 검색조건이 title일 경우
	 */
	List<Meet> findByMeetCategoryAndTitleContaining(MeetCategory meetCategory, String title);
	
	/**
	 * 검색조건이 member일 경우
	 */
	List<Meet> findByMeetCategoryAndMember(MeetCategory meetCategory, Member member);
	
	/***
	 * 조회수 증가(JPQL 문법)
	 */
	@Query("update Meet m set m.viewCount=m.viewCount+1 where m.boardNo=?1")
	@Modifying //DDL 또는 DML 문장
	int viewCountUpdate(Long boardNo);
	
}
