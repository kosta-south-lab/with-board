package withboard.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import withboard.mvc.domain.Member;
import withboard.mvc.repository.MemberRepository;
import withboard.mvc.service.MemberService;


@Controller
//@RequestMapping("/member/")
public class MemberController {

	@Autowired
	 MemberService memberService;
	
	//회원가입 페이지
	@GetMapping("/user/signupForm")
	public String signupForm() {
		
		return "/user/signupForm";
	}


	//회원가입하기 
	@RequestMapping("/user/join")
	public String joinMember(Member member) {
		
		memberService.joinMember(member); 
		return "user/joinCofirm"; // 회원가입 완료후 갈 페이지 
	}
	
	//현재 Controller에서 발생하는 모든 에외처리
	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e) {
		return new ModelAndView();
		
	}

	// 마이페이지 보기
	@RequestMapping("/user/mypageMenu")
	public void mypage(Member member) {}
	

	
	
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
