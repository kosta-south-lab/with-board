package withboard.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostMessageController {
	
	@RequestMapping("/pm/pmForm")
	public void pmForm() {}
	
	@RequestMapping("/pm/pmList")
	public void pmList() {}
}
