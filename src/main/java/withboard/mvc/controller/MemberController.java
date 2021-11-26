package withboard.mvc.controller;

import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import withboard.mvc.service.MemberService;

@Controller
public class MemberController {
	@Autowired 
	private MemberService memberService;
	
	//회원가입 페이지
	@GetMapping("/user/signup")
	public String signup() {
		
		return "/signup";
	}

	
	//로그인
	
	
	
	
	//로그아웃
	
	
	
}
