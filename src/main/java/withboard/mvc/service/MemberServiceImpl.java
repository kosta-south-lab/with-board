package withboard.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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


	/**
	 * 회원정보 가져오기 
	 */
	@Override
	public Member userInfo(String id) {
		Member userInfo = userInfo(id);
		return userInfo;
	}
	
	/**
	 * 닉네임 가져오기 
	 */
	@Override
	public String nickname(String id) {
		String nickname = nickname(id);
		return nickname;
	}
	
	//회원가입하기 
	@Override
	public void joinMember(Member member) {
		
		String pw = passwordEncoder.encode(member.getPw());
		member.setPw(pw);
		
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
		int flag = memberRepository.idCheck(id);
		
		if(flag==0) {
		     // System.out.println("해당 ID가 존재하지 않습니다.");
		      return false;
		}
		
		String mbpw = memberRepository.findPwId(id);
		if(!passwordEncoder.matches(pw, mbpw)) {
			System.out.println("비밀번호가 일치하지 않습니다.");
			return false;
		}
	
		return true;
	}
	

	
	
	 //회원정보 수정하기
	//@Override
	//public Member updateInfo(Member member, string id) {
		//Member mb = memberRepository.
		//return null;
	//}


	//탈퇴하기
	@Override
	public void deleteInfo(String id) {
		
	}

	@Override
	public Member selectById(Long memberNo) {
		return null;
	}

	//아이디 중복체크
	@Override
	public boolean idCheck(String id) {
		int result = memberRepository.idCheck(id);
		
		if(result > 0 ) return true;
		return false;
	}
	
	//닉네임 중복체크 
	@Override
	public boolean nicknameCheck(String nickname) {
		if(MemberRepository.nicknameCheck(nickname))
			return true;
	
		return false;
	}
	
	//
	@Override
	public String messageBack(Model model, String msg) {
		model.addAttribute("msg", msg);
		return "/user/messageBack";
	}

	@Override
	public Member updateInfo(Member member) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
