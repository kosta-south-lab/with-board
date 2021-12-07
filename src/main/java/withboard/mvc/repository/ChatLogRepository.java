package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.ChatLog;
import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;

public interface ChatLogRepository extends JpaRepository<ChatLog, Long> {
	
	@Query(value = "select * from chat_log where join_Match_No = :joinMatchNo"+" ORDER BY chat_log_no ASC", nativeQuery = true)
	List<ChatLog> chatLogList(Long joinMatchNo);

}
