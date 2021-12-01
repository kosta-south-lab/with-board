package withboard.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import withboard.mvc.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	 MemberService memberService;
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request, Model model) {
		
		String nickname = "";
		String loginId = (String) request.getSession().getAttribute("loginId");
		
		if(loginId != null && !"".equals(loginId)) {
			//nickname = memberService.nickname(loginId);
			nickname = "'로그인한 회원'";
		}
		
		model.addAttribute("nickname", nickname);
		
		return "home";
	}
}
