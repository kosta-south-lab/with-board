package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Long> {

}
