package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import withboard.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
		
	//이메일 전송
	Member findByEmail(String email);
	
	//회원정보 가져오기
	@Query(value = "select * from member where id = :id", nativeQuery = true)
	Member userInfo(String id);
	
	//닉네임 가져오기
	@Query(value = "select nickname from member where id = :id", nativeQuery = true)
	String nickname(String id);

	
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
	
	
	//로그인할때 pw맞는지 확인
	@Query(value = "select pw from member where id = :id", nativeQuery = true)
	String findPwId(String id);

	
	//아이디 중복체크 
	@Query(value = "select count(member_no) from member where id = :id", nativeQuery = true)
	int idCheck(String id);

	//닉네임 중복체크 
	static boolean nicknameCheck(String nickname) {
	
		return false;
	}

	
	
	/*
	 * //정보 수정하기
	 * 
	 * @Query(
	 * value="update member m m.set image = ?, m.location= ? , m.location2 = ?, m.nickname =? where id= ?; "
	 * ) Member updateInfo(Member member);
	 */
	
}
