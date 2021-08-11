package kh.spring.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;


@Controller
@RequestMapping("/mem")
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	private HttpSession session;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("joinForm")
	public String joinForm() {
		System.out.println("회원가입 화면");
		return "member/join";
	}
	@RequestMapping("joinProc")
	public String joinProc(MemberDTO dto) {
		System.out.println("회원가입");
		service.join(dto);
		return "redirect:/";
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		System.out.println("로그인 화면");
		return "member/login";
	}
	@RequestMapping("loginProc")
	public String loginProc(String email, String pw) {
		System.out.println("로그인");
		MemberDTO dto  = service.login(email, pw);
		if(dto != null) {
			session.setAttribute("login",dto);
			// 세션 유지시간 1시간
		    session.setMaxInactiveInterval(60*60) ;
		}
		return "redirect:/";
	}
	//로그아웃
	@RequestMapping("logoutProc")
	public String logoutProc() {
		System.out.println("로그아웃");
		session.invalidate();
		return "redirect:/";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "EmailChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		//logger.info("memberIdChk() 진입");
		System.out.println("아이디체크");
		int result = service.idCheck(memberId);
		System.out.println("결과값 = " + result);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
	} // memberIdChkPOST() 종료	

	/* 이메일 인증 */
	@RequestMapping(value="mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 : " + email);
		//logger.info();
		//logger.info();
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "project.hi.final@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
						"<br><br>" + 
						"인증 번호는 " + checkNum + "입니다." + 
						"<br>" + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);

		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
		
	}

}
