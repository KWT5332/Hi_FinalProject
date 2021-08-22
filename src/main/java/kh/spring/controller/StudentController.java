package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ChartDTO;
import kh.spring.dto.PayDTO;
import kh.spring.service.StudentService;

@Controller
@RequestMapping("/sdt")
public class StudentController {

	@Autowired
	private StudentService service;
	
	@RequestMapping("researchHome")
	public String researchHome() {
		return "student/research";
	}
	
	@RequestMapping("researchResult")
	public String reserchResult(ChartDTO dto) {
		int result = service.researchInsert(dto);
		return "redirect:/sdt/payHome";
	}
	
	@RequestMapping("payHome")
	public String payHome() {
		return "student/payment";
	}
	
	@RequestMapping("payInfo")
	public String payInfo(PayDTO dto) {
		int result = service.payInsert(dto);
		return "redirect:/";
	}
	
}
