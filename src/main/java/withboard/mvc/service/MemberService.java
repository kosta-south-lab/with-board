package withboard.mvc.service;

import org.springframework.ui.Model;

import withboard.mvc.domain.Mail;
import withboard.mvc.domain.Member;

public interface MemberService {

	/**
	 * 회원정보 가져오기 
	 */
	Member userInfo(String id); 
	
	/**
	 * 닉네임 가져오기 
	 */
	String nickname(String id); 
	
	/**
	 * 회원가입
	 */
	void joinMember(Member member);
	
	/**
	 * 로그인체크
	 */
	boolean checkLogin(String id, String pw); 
	
	
	/**
	 * 회원정보 수정하기 
	 */
	Member updateInfo(Member member); 
	
	/**
	 * 회원탈퇴하기 
	 */
	void deleteInfo(String id);
	
	/**
	 * 이메일 체크
	 * */
	Member mailCheck(Mail dto);
	
	/**
	 * 이메일 업데이트
	 * */
	void mailUpdate(Mail dto);
	
	/**
	 * 아이디에 따른 회원 상세정보 조회
	 * */
	Member selectById(Long memberNo);

	/**
	 * 아이디 중복체크
	 */
	boolean idCheck(String id);
	
	/**
	 * 닉네임 중복 확인
	 */
	boolean nicknameCheck(String nickname);
	
	
	String messageBack(Model model, String msg);
	
}
