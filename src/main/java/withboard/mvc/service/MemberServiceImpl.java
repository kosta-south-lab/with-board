package withboard.mvc.service;

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
		System.out.println("pw확인 : "+ pw);
		
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
	
	// 로그인시 id ,password 체크
	@Override
	public boolean checkLogin(String id, String pw) {
		Member loginMember = memberRepository.findById(id);
		
		if(loginMember==null) {
		      System.out.println("해당 ID가 존재하지 않습니다.");
		      return false;
		   }

		   if(!passwordEncoder.matches(pw, loginMember.getPw())) {
		      System.out.println("비밀번호가 일치하지 않습니다.");
		      return false;
		   }
	
		return false;
	}
	
	/*
	 * //회원정보 수정하기
	 * 
	 * @Override public Member updateInfo(Member member) { Member mb =
	 * memberRepository.updateInfo(member); if(mb==null) throw new
	 * RuntimeException("");
	 * 
	 * mb.setImage(member.getEmail()); mb.setLocation(member.getLocation());
	 * //mb.setLocation2(member.setLocation2(null));
	 * mb.setNickname(member.getNickname());
	 * 
	 * return mb; }
	 */

	//정보 수정하기
	@Override
	public Member updateInfo(Member member) {
		// TODO Auto-generated method stub
		return null;
	}


	//탈퇴하기
	@Override
	public void deleteInfo(String id) {
		
	}


}
