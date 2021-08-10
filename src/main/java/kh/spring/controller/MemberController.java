package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		}
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

}
