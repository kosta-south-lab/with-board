package withboard.mvc.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import lombok.Value;
import withboard.mvc.domain.Mail;
import withboard.mvc.domain.Member;
import withboard.mvc.service.MemberService;
import withboard.mvc.service.SendEmailService;


@Controller
@RequiredArgsConstructor
//@RequestMapping("/member/")
public class MemberController {

	@Autowired
	 MemberService memberService;
	@Autowired
	SendEmailService emailService;

	
	// 회원가입 페이지
	@GetMapping("/user/signupForm")
	public String signupForm() {
		
		return "user/signupForm"; //WEB-INF/views/user/signupForm.jsp
	}
	
	
	// 유저 정보 저장    
	@GetMapping("/user/userInfo")    
	public Member myInfo(String id ,HttpServletRequest request ) throws Exception {
	Member user = memberService.userInfo(id);    
	request.setAttribute("user", user);              
	return user;      
	}
	
	
	// 회원가입하기 
	@RequestMapping("/user/joinConfirm")
	public String joinMember(Member member, Model model,HttpServletRequest request, List<MultipartFile> filename, HttpSession session) throws Exception {
		
		/*
		 * //파일 저장 String path =
		 * session.getServletContext().getRealPath("/resources/images/board");
		 * List<String> filenameList = new ArrayList<String>();
		 * 
		 * for(MultipartFile file : filename) {
		 * 
		 * String originalFileName = file.getOriginalFilename();
		 * 
		 * //파일이 들어오지 않아도 파일 1개가 ""로 들어오게된다. 그 경우 걸러내는 작업 if(originalFileName == "") {
		 * break; }
		 * 
		 * String newFileName = this.changeFileName(originalFileName); File newFile =
		 * new File(path + "/" + newFileName);
		 * filenameList.add("/resources/images/board/" + newFileName); try {
		 * file.transferTo(newFile); }catch (Exception e) { e.printStackTrace(); } }
		 */
		boolean idCheck = memberService.idCheck(member.getId());
		if(idCheck) {
			String msg = member.getId() + "는 이미 사용중인 아이디입니다";
			
			model.addAttribute("msg", msg);
			model.addAttribute("member", member);
			
			return "user/signupForm";
		}
		
		memberService.joinMember(member); 
		request.getSession().setAttribute("member", member);
		
		return "user/joinConfirm";// 회원가입 완료후 갈 페이지
		//return "redirect:/login"; // 회원가입 완료후 갈 페이지 
	}
	
	//@Value("${file.path}")
	//private String fileRealPath;

	

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
	

	//현재 Controller에서 발생하는 모든 에외처리
	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e) {
		return new ModelAndView();
		
	}
	
	
	// 로그인 form
	@GetMapping("/user/loginForm")
	public String loginForm(HttpServletRequest request, Model model) {
		
		String loginId = (String) request.getSession().getAttribute("loginId");
		if(loginId != null && !"".equals(loginId)) {
			String msg = "이미 로그인하셨습니다";
			return memberService.messageBack(model, msg);
		}
		
		return "user/loginForm";
	}
	
	// 로그인 form test
	@RequestMapping("/user/test")
	public void test() {}
	
	
	// 로그인 처리
	@RequestMapping("/loginProcess2")
	public String loginProcess(Member member, HttpServletRequest request, Model model) {
		boolean loginCheck = memberService.checkLogin(member.getId(), member.getPw()); 
		Member members =  memberService.userInfo(member.getId());
		if(!loginCheck){
			String msg = "아이디 또는 패스워드가 맞지않습니다";
			return memberService.messageBack(model, msg);
		}
		
		request.getSession().setAttribute("loginId", member.getId());
        request.getSession().setAttribute("member", members); //전체 정보 가져오는 ...
		
		return "/index"; // 회원가입 완료후 갈 페이지 
	}
	
	
	
	// 로그아웃 처리
	@RequestMapping("/user/logout2")
	public String logout2(HttpServletRequest request, HttpSession session) throws Exception {
		
		String loginId = (String) request.getSession().getAttribute("loginId");
		if(loginId != null && !"".equals(loginId)) {
			
			request.getSession().setAttribute("loginId", "");
			request.getSession().removeAttribute("loginId");//키값(loginId)에 해당되는 세션만 삭제함
			session.invalidate();
		}
		
		return "redirect:/user/loginForm";
	}
	
		
	// 마이페이지 보기
	@RequestMapping("/user/mypage")
	public void myPage() {
	}
	
	
	
	 // 회원정보 수정폼...
	 @RequestMapping("/user/updateInfo")
	 public ModelAndView updateInfo(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		 System.out.println("getId : " + member.getId());
		 
		 Member mb = memberService.userInfo(member.getId());
	 
	 return new ModelAndView("/user/updateInfo", "member", mb); 
	 }
	 
	 
	 
	 // 회원정보 수정 처리
	 @RequestMapping("/user/changeInfo")
	 public ModelAndView changeInfo(Member member, HttpSession session) {
			memberService.updateInfo(member);
		 
		 return new ModelAndView ("/user/mypage", "member", member); //수정처리 완료후 
	 }
	 

	
	// 회원가입 완료 후 이메일 인증 처리
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
				"	href=\"http://localhost:9999/user/email/certified?username=" + dto.getUsername() + "&emailConfirm=" + dto.getEmailConfirm() + "\" target=\"_blank\">"+ 
				"		<button> 메일 인증 </button>"+ 
				"	</a>"+
				" </div>"
		);
		emailcontent.append("</body>");
		emailcontent.append("</html>");
		
		
		
		emailService.signUpSendEmail(dto.getEmail(),"메일 인증",emailcontent.toString());
	}


	@GetMapping(value = "/user/email/certified") //username=지윤%20&emailConfirm=confirmNot
	public String checkmail(Mail dto, HttpSession session) throws MessagingException {
		System.out.println("checkmail.......");

		Member member = memberService.mailCheck(dto);
		
		
		return "user/emailSuccess";
	}
	
	
	//아이디 찾기 폼으로 이동
	@RequestMapping("/user/searchId")
	public void searchId() {}
	
	
	//아이디 찾기
		@RequestMapping("/user/searchId2")
		public String searchId(String email, HttpServletRequest request) {
		  
			Member member = memberService.searchId(email);
			String id = member.getId();
			System.out.println(id);
			
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			
			return "user/idView";
			
		}
		
		//비번찾기 폼으로 이동
		@RequestMapping("/user/searchPass2")
		public void searchPass() {
			
		}
		
		//Email과 name의 일치여부를 check하는 컨트롤러
		 @GetMapping("/check/findPw")
		    public @ResponseBody Map<String, Boolean> pw_find(String userEmail, String userName){
		        Map<String,Boolean> json = new HashMap<>();
		        boolean pwFindCheck = memberService.userEmailCheck(userEmail,userName);

		        System.out.println(pwFindCheck);
		        json.put("check", pwFindCheck);
		        return json;
		    }

		//등록된 이메일로 임시비밀번호를 발송하고 발송된 임시비밀번호로 사용자의 pw를 변경하는 컨트롤러
		    @PostMapping("/check/findPw/sendEmail")
		    public String sendEmail(String userEmail, String userName){
		        Mail dto = emailService.createMailAndChangePassword(userEmail, userName);
		        emailService.passwordMailSend(dto);
		        
		        System.out.println("컨트롤러 sendEmail");
		        return "user/confirmMail";

		    }
		    
		
		    
		    
		    //비밀번호 변경 폼으로 이동~~
		    @RequestMapping("/user/passChange")
		    public void passChange() {}
		    
		    
		    //비밀번호 변경
		    @RequestMapping("/user/newPass")
		    public String newPass(String pass, String newPass, HttpSession session, HttpServletRequest request) throws Exception {
		    	Member member = (Member) request.getSession().getAttribute("member"); //현재로그인한 계정
			 System.out.println("getId : " + member.getId());
			
		
			memberService.changePass(pass, newPass, member);
			
		       
		        return "user/confirmPass";
		    }
		    
	
}
