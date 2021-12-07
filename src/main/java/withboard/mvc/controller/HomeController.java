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
	
	@RequestMapping("/index")
	public void index() {}

}
