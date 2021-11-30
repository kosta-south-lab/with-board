package withboard.mvc.controller;

import javax.mail.MessagingException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import withboard.mvc.domain.Mail;
import withboard.mvc.domain.Member;
import withboard.mvc.service.MemberService;
import withboard.mvc.service.SendEmailService;


@Controller
//@RequestMapping("/member/")
public class MemberController {

	@Autowired
	 MemberService memberService;
	@Autowired
	SendEmailService emailService;
	
	
	
	//회원가입 페이지
	@GetMapping("/user/signupForm")
	public String signupForm() {
		
		return "user/signupForm";
	}

	//회원가입하기 
	@RequestMapping("/user/joinConfirm")
	public String joinMember(Member member,HttpSession session) {
		System.out.println("joinConfirm............................");
		memberService.joinMember(member); 
		session.setAttribute("principal",member);
		
	      System.out.println(111111);
		return "user/joinConfirm";// 회원가입 완료후 갈 페이지 
	}
	
	//현재 Controller에서 발생하는 모든 에외처리
	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e) {
		return new ModelAndView();
		
	}

	// 로그인 처리
	@RequestMapping("/loginProcess")
	public String loginProcess(Member member) {
		boolean loginCheck = memberService.checkLogin(member.getId(),member.getPw()); 
		if(loginCheck){
			// 시큐리티 인증처리
		}
		return "redirect:/home"; // 회원가입 완료후 갈 페이지 
	}
	
	// 로그아웃

	
	
	
	// 마이페이지 보기
	@RequestMapping("/user/{id}")
	  public ModelAndView myPage(@PathVariable Long memberid) {
		
		Member member = memberService.selectById(memberid);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/mypage");
		mv.addObject("user", member);
		
	    return mv;
	  }
	
	
	// 정보수정 form 
	
	
	
	
	/*
	 * // 내정보 수정완료
	 * 
	 * @RequestMapping("/updateInfo") public ModelAndView updateInfo(Member member){
	 * Member mb = memberService.updateInfo(member);
	 * 
	 * return new ModelAndView("user/mypage","member",mb);
	 * 
	 * }
	 */
	

	
	// id 중복체크 
	
	
	
	
	// 닉네임 중복체크 


	
	//회원가입 완료 후 이메일 인증 처리
	@ResponseBody
	@GetMapping(value = "/user/email/send")
	public void sendmail(Mail dto) throws MessagingException {
		
		
		StringBuffer emailcontent = new StringBuffer();
		
		emailcontent.append("<!DOCTYPE html>");
		emailcontent.append("<html>");
		emailcontent.append("<head>");
		emailcontent.append("</head>");
		emailcontent.append("<body>");
		emailcontent.append(
				" <div>" + 
						dto.getUsername()+
				"		님 안녕하세요.<br />"+ 
				"		아래 메일 인증 버튼을 클릭하여 회원가입을 완료해 주세요.<br />"+ 
				"		감사합니다.<br />"+ 
				"	<a"	+
				"	href=\"http://localhost:8080/user/email/certified?username=" + dto.getUsername() + "&emailConfirm=" + dto.getEmailConfirm() + "\" target=\"_blank\">"+ 
				"		<button> 메일 인증 </button>"+ 
				"	</a>"+
				" </div>"
		);
		emailcontent.append("</body>");
		emailcontent.append("</html>");
		
		emailService.signUpSendEmail(dto.getEmail(),"메일 인증",emailcontent.toString());
		
		
	}

	

	@GetMapping(value = "/user/email/certified")
	public String checkmail(Mail dto) throws MessagingException {

		Member member = memberService.mailCheck(dto);
		
		if(member != null) {
			memberService.mailUpdate(dto);
			session.invalidate(); //  로그아웃
		}else {
			System.out.println("실패");
		}

		return "user/emailSuccess";
	}

	
	
}
