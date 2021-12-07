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
	 * 회원가입
	 */
	void joinMember(Member member);
	
	/**
	 * 로그인체크
	 */
	boolean checkLogin(String id, String pw); 
	
	/**
	 * 회원정보 수정하기  
	 * 
	 */
	void updateInfo(Member member);
	
	 /**
     * 회원정보 삭제
     * */
    //void delete(Long id);

	
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
	Member searchId(String email);
	
	/**
	 * 비밀번호 메일 전송체크
	 * */
	boolean userEmailCheck(String userEmail, String userName);
	
	/**
	 * 새 비밀번호 변경
	 * */
	public void changePass(String pass, String newPass);



	
	
}
