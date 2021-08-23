package kh.spring.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String payHome(Model m) {
		
		// 한달 후 날짜
		Calendar mon_next = Calendar.getInstance();
		mon_next.add(Calendar.MONTH , +1);
		String monthDate_next = new java.text.SimpleDateFormat("MM").format(mon_next.getTime());
		System.out.println(monthDate_next);
		
		// 테스트용 지금 날짜
		Calendar mon = Calendar.getInstance();
		String monthDate = new java.text.SimpleDateFormat("MM").format(mon.getTime());
		System.out.println(monthDate);
		
		// 급식비
		int payment = service.payment(monthDate);
		int pay = payment * 5000;
		
		System.out.println(monthDate + "월 급식비 : " + pay);
		m.addAttribute("pay", pay);
		
		return "student/payment";
	}
	
	@RequestMapping("payInfo")
	public String payInfo(PayDTO dto) {
		int result = service.payInsert(dto);
		return "redirect:/";
	}
	
}
