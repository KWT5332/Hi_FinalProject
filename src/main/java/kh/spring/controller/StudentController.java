package kh.spring.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ChartDTO;
import kh.spring.dto.MealDTO;
import kh.spring.dto.PayDTO;
import kh.spring.service.StudentService;

@Controller
@RequestMapping("/sdt")
public class StudentController {

	@Autowired
	private StudentService Ssv;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("researchHome")
	public String researchHome(String month, String pm, String school, String email, Model m) {
		
		// 한달 전 날짜
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.MONTH , -1);
		String b_month = new java.text.SimpleDateFormat("MM").format(mon.getTime());
		System.out.println(b_month);
		System.out.println(month);
		
		List<MealDTO> list = Ssv.bestOp(b_month, school);
		m.addAttribute("bestOp", list);
		m.addAttribute("b_month", b_month);
		m.addAttribute("month", month);
		m.addAttribute("payment", pm);
		m.addAttribute("school", school);
		m.addAttribute("parent_email", email);
		System.out.println(pm + " : " + school + " : " + email);
		
		return "student/research";
	}
	
	@RequestMapping("researchResult")
	public String reserchResult(String school, String b_month, String month, String payment, String email, ChartDTO dto) {
		System.out.println(b_month + " : " + month + " : " + school + " : " + payment + " : " + email);
		int result = Ssv.researchInsert(dto);
		return "forward:/sdt/payHome";
	}
	
	@RequestMapping("payHome")
	public String payHome(String school, String month, String payment, Model m) {
		System.out.println(school + " : " + month + " : " + payment);
		int pay = Integer.parseInt(payment);
		
		m.addAttribute("school", school);
		m.addAttribute("month", month);
		m.addAttribute("pay", pay);
		
		System.out.println(month + "월 급식비 : " + pay);
		
		return "student/payment";
	}
	
	
	@RequestMapping("payInfo")
	public String payInfo(PayDTO dto) {
		System.out.println();
		int result = Ssv.payInsert(dto);
		return "redirect:/";
	}
	
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
