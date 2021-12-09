package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;

public interface JoinMatchRepository extends JpaRepository<JoinMatch, Long> {

	@Query(value = "select * from join_match where member_No = :memberNo"+" ORDER BY join_match_no DESC", nativeQuery = true)
	List<JoinMatch> joinMatchList(Long memberNo);

	//@Query(value = "select * from join_match where member_No = :memberNo"+" ORDER BY join_match_no DESC", nativeQuery = true)
	@Query(value = "select join_match_no from CHAT_LOG where member_No = :memberNo"+" GROUP BY join_match_no order by join_match_no ASC", nativeQuery = true)
	List<JoinMatch> joinMatchList2(Long memberNo);
	@Query(value = "select * from join_match where join_match_no = :joinMatchNo"+" ORDER BY join_match_no DESC", nativeQuery = true)
	List<JoinMatch> joinMatchList3(Long joinMatchNo);
}