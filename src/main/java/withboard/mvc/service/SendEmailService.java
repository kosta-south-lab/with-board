package withboard.mvc.service;

import withboard.mvc.domain.Mail;

public interface SendEmailService {
	
	
	/**
	 * Mail DTO에 보낼 내용과 제목을 저장
	 * */

    public Mail createMailAndChangePassword(String userEmail, String userName);
    
    /**
     * 이메일로 발송된 임시비밀번호로 해당 유저의 패스워드 변경
     * */
    public void updatePassword(String str,String userEmail);
    
    
    /**
     * 임시비밀번호를 위한 0자리의 랜덤난수를 생성하는 메소드
     * */
    public String getTempPassword();
    
    
    /**
     * 이메일 전송
     * */
    public void mailSend(Mail mailDto);
    
    

}
