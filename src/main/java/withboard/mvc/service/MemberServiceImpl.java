package withboard.mvc.service;

import java.sql.SQLException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import withboard.mvc.domain.Authorities;
import withboard.mvc.domain.Mail;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.AuthoritiesRepository;
import withboard.mvc.repository.MemberRepository;

@Service
@AllArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberRepository memberRepository;

	@Autowired
	AuthoritiesRepository authoritiesRepository;

	@Autowired
	PasswordEncoder passwordEncoder;


	//회원가입하기 
	@Override
	public void joinMember(Member member) {
		
		String pw = passwordEncoder.encode(member.getPw());
		member.setPw(pw);
		System.out.println(pw);
		
		Member mb = memberRepository.save(member);
		//권한을 주기위한 ...
		Authorities authorities = new Authorities();
		authorities.setMember(mb);
		authorities.setRole("USER");
		authoritiesRepository.save(authorities);
	}
	
	//이메일 인증확인
	public Member mailCheck(Mail dto) {
		Member userEntity = memberRepository.mCheck(dto.getUsername(), dto.getEmailConfirm());
		return userEntity;
	}
	
	public void mailUpdate(Mail dto) {
		memberRepository.mUpdate(dto.getUsername());	
	}
	
	// id, pw 동일한지 확인
	@Override
	public boolean checkLogin(String id,String pw) {
		
		//회원정보 가지고 와서 맞는지 비교 equls로!
		
		return true;
		
	}


}
