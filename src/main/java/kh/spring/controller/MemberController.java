package kh.spring.controller;

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
	
	@RequestMapping("joinForm")
	public String joinForm() {
		System.out.println("회원가입 화면");
		return "member/join";
	}
	@RequestMapping("joinProc")
	public String joinProc(MemberDTO dto) {
		System.out.println("회원가입");
		
		service.insert(dto);
		
		return "redirect:/";
	}

}
