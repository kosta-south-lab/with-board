package withboard.mvc.service;

import java.util.List;

import org.springframework.ui.Model;

import withboard.mvc.domain.Mail;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.Normal;

public interface MemberService {

	/**
	 * 회원정보 가져오기 
	 */
	Member userInfo(String id);

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
	void updateInfo(Member member);
	
	/**
	 * 이메일 체크
	 * */
	Member mailCheck(Mail dto);
	
	/**
	 * 이메일 업데이트
	 * */
	void mailUpdate(Mail dto);

	/**
	 * 아이디 중복체크
	 */
	boolean idCheck(String id);
	
	/**
	 * 닉네임 중복체크 
	 */
	boolean nickCheck (String nickname);
	
	/**
	 * .jsp에 message 저장해서 error 떴을때 다시 되돌리기
	 */
	String messageBack(Model model, String msg);
	
	/**
	 * 아이디 찾기
	 * */
	String searchId(String email);

	
	
}
