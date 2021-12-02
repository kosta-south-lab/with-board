package withboard.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sample")
public class SampleController {

	
	
	@RequestMapping("/about")
	public void about() {}
	
	@RequestMapping("/blog")
	public void blog() {}
	
	@RequestMapping("/blogSingle")
	public void blogSingle() {}
	
	@RequestMapping("/contact")
	public void contact() {}
	
	@RequestMapping("/index")
	public void index() {}
	
	@RequestMapping("/index2")
	public void index2() {}
	
	@RequestMapping("/portfolio")
	public void portfolio() {}
	
	@RequestMapping("/portfolioDetails")
	public void portfolioDetails() {}
	
	@RequestMapping("/pricing")
	public void pricing() {}
	
	@RequestMapping("/services")
	public void services() {}
	
	@RequestMapping("/team")
	public void team() {}
}
