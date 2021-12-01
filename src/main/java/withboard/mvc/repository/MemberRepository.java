package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
		
	//이메일 전송
	Member findByEmail(String email);
	
	//이메일 값 체크
	@Query(value = "select * from user where username = username and emailConfirm = emailConfirm", nativeQuery = true)
	Member mCheck(String username, String emailConfirm);
	
	//체크 후 계정 활성화
	@Query(value = "update user set emailConfirm = 'Y' where username = username", nativeQuery = true)
	void mUpdate(String username);
	
	/**
	 * 검색어로 멤버 조회
	 * */
	Member findByNicknameContaining(String nickname);
	
	//로그인할때 id,pw맞는지 확인
	Member findById(String id);
	
	/*
	 * //정보 수정하기
	 * 
	 * @Query(
	 * value="update member m m.set image = ?, m.location= ? , m.location2 = ?, m.nickname =? where id= ?; "
	 * ) Member updateInfo(Member member);
	 */
	
}
