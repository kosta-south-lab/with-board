package withboard.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import withboard.mvc.domain.Member;
import withboard.mvc.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	private JavaMailSender mailSender;

	@Override
	public void sendVerificationEmail(Member member) {
		 SimpleMailMessage mailMessage = new SimpleMailMessage();
	        mailMessage.setTo(member.getEmail());
	        mailMessage.setSubject("Webluxible 회원 가입 인증");
	        mailMessage.setText(String.format("/check-email-token?token=%s&email=%s", member.getEmailToken(),
	                member.getEmail()));
	        mailSender.send(mailMessage);
		
	}

	@Override
	public Member findAccountByEmail(String email) {
	
		return memberRepository.findByEmail(email);
	}
	

}
