package withboard.mvc.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import withboard.mvc.domain.Mail;
import withboard.mvc.repository.MemberRepository;

@Service
@AllArgsConstructor
public class SendEmailServiceImpl implements SendEmailService {
	
	@Autowired
	MemberRepository memberRepository;
	
	private JavaMailSender mailSender;
    private static final String FROM_ADDRESS = "teamsouthlab@gmail.com";



    public Mail createMailAndChangePassword(String userEmail, String userName){
        String str = getTempPassword();
        Mail dto = new Mail();
        dto.setAddress(userEmail);
        dto.setTitle(userName+"님의 임시비밀번호 안내 이메일 입니다.");
        dto.setMessage("안녕하세요. 임시비밀번호 안내 관련 이메일 입니다." + "[" + userName + "]" +"님의 임시 비밀번호는 "
        + str + " 입니다.");
       // updatePassword(str,userEmail);
        return dto;
    }

    public void updatePassword(String str,String userEmail){ 
/**        String pw = EncryptionUtils.encryptMD5(str);
        int id = MemberRepository.findUserByUserId(userEmail).getId();
        MemberRepository.updateUserPassword(id,pw);*/
    }


    public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }
    
    public void passwordMailSend(Mail mailDto){
        System.out.println("이메일 전송 완료!");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailDto.getAddress());
        message.setFrom(SendEmailServiceImpl.FROM_ADDRESS);
        message.setSubject(mailDto.getTitle());
        message.setText(mailDto.getMessage());

        mailSender.send(message);
    }
    
    public void signUpSendEmail(String to, String subject, String text) throws MessagingException {
    	System.out.println("to : " + to);
    	MimeMessage mimeMessage = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
    	
    	helper.setFrom(FROM_ADDRESS);
    	helper.setTo(to); 
    	helper.setSubject(subject); 
    	
    	//setText의 경우 true옵션을 추가할 경우 메일을 보낼때 html문법이 적용
    	helper.setText(text, true);    	
    	
    	mailSender.send(mimeMessage);
    	System.out.println("SendEmal.....................");
    }

	
    
    

}
