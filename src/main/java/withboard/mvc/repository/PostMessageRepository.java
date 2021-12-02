package withboard.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.PostMessage;

public interface PostMessageRepository extends JpaRepository<PostMessage, Long> {
	
	/**
	 * 수신인으로 쪽지 찾기
	 * */
	List<PostMessage> findByReceiveId(String receiveId);
}
