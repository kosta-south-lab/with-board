package withboard.mvc.controller;

import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;
import withboard.mvc.domain.Member;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.service.MemberService;

@Log
@Controller
//@RequestMapping("/member/")
public class MemberController {
	@Autowired 
	PasswordEncoder pwEncoder;
	@Autowired
	MemberRepository repo;
	
	
	//회원가입 페이지
	@GetMapping("/user/signup")
	public String signupForm() {
		
		return "/user/signup";
	}

	
	//회원가입 처리
	@PostMapping("/user/signup")
	public String Singup(Member member ) {
		
		//memberService.joinUser(member); //service에 joinUser만들기
		
		return "redirect:/user/login";
	}
	
	//로그인 페이지  
	
	
	
	
	
	//로그아웃
	
	
	//회원가입시 이메일 인증
	
	private MemberRepository memberRepository;

	    @GetMapping("/check-email-token")
	    public String verifyEmail(String token, String email, Model model) {
	        Member member = memberRepository.findByEmail(email);
	        if (member == null) {
	            model.addAttribute("error", "wrong.email");
	            return "account/email-verification";
	        }
	        if (!token.equals(member.getEmailToken())) {
	            model.addAttribute("error", "wrong.token");
	            return "account/email-verification";
	        }
	        member.verified();
	        model.addAttribute("numberOfUsers", memberRepository.count());
	        model.addAttribute("nickname", member.getNickname());
	        return "account/email-verification";
	    }
	
	
	
}
