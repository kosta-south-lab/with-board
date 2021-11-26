package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {

}
