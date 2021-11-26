package withboard.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
    private static final String FROM_ADDRESS = "본인의 이메일 주소를 입력하세요!";



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
    
    public void mailSend(Mail mailDto){
        System.out.println("이메일 전송 완료!");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailDto.getAddress());
        message.setFrom(SendEmailServiceImpl.FROM_ADDRESS);
        message.setSubject(mailDto.getTitle());
        message.setText(mailDto.getMessage());

        mailSender.send(message);
    }
    
    

}
