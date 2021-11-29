package withboard.mvc.service;

import withboard.mvc.domain.Member;

public interface MemberService {

	/**
	 * 회원가입
	 */
	void joinMember(Member member);
	
	/**
	 * 로그인
	 */
	
	
	/**
	 * 로그아웃
	 */
	
	
	/**
	 * 회원가입 시 이메일 인증
	 * */
	void sendVerificationEmail(Member member);
	
	/**
	 * 이메일에 해당하는 계정 불러오기
	 * */
	 public Member findAccountByEmail(String email);
}
