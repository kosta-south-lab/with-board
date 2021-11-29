package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
		
	//이메일 전송
	Member findByEmail(String email);
	
	//이메일 값 체크
	@Query(value = "select * from user where username = :username and emailConfirm = :emailConfirm", nativeQuery = true)
	Member mCheck(String username, String emailConfirm);
	
	//체크 후 계정 활성화
	@Query(value = "update user set emailConfirm = 'Y' where username = :username", nativeQuery = true)
	void mUpdate(String username);
	
	
	
	
}
