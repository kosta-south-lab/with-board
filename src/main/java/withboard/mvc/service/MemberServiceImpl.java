package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import withboard.mvc.domain.Mail;
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


	//회원가입하기 
	@Override
	public void joinMember(Member member) {
		Member mb = memberRepository.save(member);
		
	}
	
	//이메일 인증확인
	public Member mailCheck(Mail dto) {
		Member userEntity = memberRepository.mCheck(dto.getUsername(), dto.getEmailConfirm());
		return userEntity;
	}
	
	public void mailUpdate(Mail dto) {
		memberRepository.mUpdate(dto.getUsername());	
	}
	

}
