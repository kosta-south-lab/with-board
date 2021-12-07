package withboard.mvc.service;

import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.AllArgsConstructor;
import withboard.mvc.domain.Authorities;
import withboard.mvc.domain.Game;
import withboard.mvc.domain.Image;
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
        Member member = memberRepository.userInfo(id);
        if(member==null) {
        	throw new RuntimeException("회원정보가 존재하지 않습니다.");
        }
        return member;
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
		
		if(userEntity != null) {
			//memberRepository.mUpdate(dto.getUsername());	
			userEntity.setEmailConfirm("Y");
		}else {
			throw new RuntimeException("이메일 인증에 실패하였습니다.");
		}

		
		return userEntity;
	}
	
	public void mailUpdate(Mail dto) {
		//memberRepository.mUpdate(dto.getUsername());	
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
	

	//아이디 중복체크
	@Override
	public boolean idCheck(String id) {
		int result = memberRepository.idCheck(id);
		
		if(result > 0 ) return true;
		return false;
	}
	
	//닉네임 중복체크
	@Override
	public boolean nickCheck(String nickname) {
		int result = memberRepository.nickCheck(nickname);
		
		if(result > 0 ) return true;
		return false;
	}

	
	//error났을때
	@Override
	public String messageBack(Model model, String msg) {
		model.addAttribute("msg", msg);
		return "/user/messageBack";
	}
	
	
	//아이디 찾기
	@Override
	public String searchId(@PathVariable String email)  {
		System.out.println(email);
		String id = memberRepository.searchId(email);
		if(id==null) {
			throw new RuntimeException("해당 이메일로 가입한 회원이 존재하지 않습니다.");
		}
		
		return id;
	}


	//회원정보 수정하기 
	@Override
	public void updateInfo(Member member) {
		
		Member mb = memberRepository.findById(member.getId());
		//Member mb = memberRepository.findById(member.getMemberNo()).orElse(null);
		
		//회원정보 수정부분 
		mb.setImage(member.getImage());
		mb.setNickname(member.getNickname());
		mb.setGender(member.getGender());
		mb.setLocation(member.getLocation());
		mb.setLocation2(member.getLocation2());
		mb.setEmail(member.getEmail());
	
	}

	/*
	 * //탈퇴하기
	 * 
	 * @Override public void delete(Long id) { Optional<Member> member =
	 * memberRepository.findById(id); if (member == null) throw new
	 * RuntimeException("회원탈퇴에 실패했습니다.");
	 * 
	 * memberRepository.deleteById(id);
	 * 
	 * }
	 */
	
	/**
	 * 파일이름 랜덤생성
	 * */
	private String changeFileName(String originalName){
		//uuid 생성
		UUID uuid = UUID.randomUUID();
		//랜덤생성 + 파일이름
		String savedName = uuid.toString() + "_" + originalName;		
		return savedName;
	}
	
	/**
	 * 이메일 전송 체크
	 * */
	public boolean userEmailCheck(String userEmail, String userName) {

        Member member = memberRepository.findUserByUserId(userEmail);
        if(member!=null && member.getName().equals(userName)) {
            return true;
        }
        else {
            return false;
        }
    }
	

	/**
	 * 새 비밀번호 변경
	 * */
	@Override
	public void changePass(String pass, String newPass) {
		Member member = new Member();
		if(member.getPw().equals(passwordEncoder.encode(pass))) {
			boolean set = memberRepository.changePass(pass, newPass);
			if(set==true) member.setPw(newPass);
	}
		
	
}

}