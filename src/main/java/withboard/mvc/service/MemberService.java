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
	/* public boolean checkLogin(String id,String pw); */
	public boolean checkLogin(String email, String password);
	
	/**
	 * 회원정보 수정하기 
	 */
	public Member updateInfo(Member member); 
	
	/**
	 * 회원탈퇴하기 
	 */
	public void deleteInfo(String id);
	
	/**
	 * 이메일 체크
	 * */
	public Member mailCheck(Mail dto);
	
	/**
	 * 이메일 업데이트
	 * */
	public void mailUpdate(Mail dto);

	
	
}
