package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import withboard.mvc.domain.Member;
import withboard.mvc.domain.Normal;
import withboard.mvc.repository.AuthoritiesRepository;
import withboard.mvc.repository.MemberRepository;

@Service
@AllArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberRepository memberRepository;

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
	
	//회원가입하기 
	@Override
	public void joinMember(Member member) {
		Member mb = memberRepository.save(member);
		
	}
	

}
