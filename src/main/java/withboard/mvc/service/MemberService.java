package withboard.mvc.service;

import withboard.mvc.domain.Mail;
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
	 * 이메일 체크
	 * */
	public Member mailCheck(Mail dto);
	
	/**
	 * 이메일 업데이트
	 * */
	public void mailUpdate(Mail dto);
	
}
