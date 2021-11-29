package withboard.mvc.controller;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.ReadOnlyProperty;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import withboard.mvc.domain.Mail;
import withboard.mvc.domain.Member;
import withboard.mvc.service.MemberService;
import withboard.mvc.service.SendEmailService;
import withboard.mvc.service.SendEmailServiceImpl;


@Controller
//@RequestMapping("/member/")
public class MemberController {

	@Autowired
	 MemberService memberService;
	
	@Autowired
	SendEmailService emailService;
	
	private HttpSession session;
	
	//회원가입 페이지
	@GetMapping("/user/signupForm")
	public String signupForm() {
		
		return "user/signupForm";
	}


	//회원가입하기 
	@RequestMapping("/user/joinConfirm")
	public String joinMember(Member member) {
		System.out.println(1111);
		memberService.joinMember(member); 
		System.out.println(222);
		return "user/joinConfirm"; // 회원가입 완료후 갈 페이지 
	}
	
	
	//현재 Controller에서 발생하는 모든 에외처리
	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e) {
		return new ModelAndView();
		
	}


	// 마이페이지 보기
	@RequestMapping("/user/mypageMenu")
	public void mypage(Member member) {}

	
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
