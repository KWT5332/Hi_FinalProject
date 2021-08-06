package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
