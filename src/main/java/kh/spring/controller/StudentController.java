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
	
	// 설문조사 페이지
	@RequestMapping("researchHome")
	public String researchHome(String school, String email, String pm, Model m) {

		// 이번 달 기준 한달 전, 한달 후 날짜
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.MONTH , -1);
		mon.add(Calendar.MONTH, +1);
		String b_month = new java.text.SimpleDateFormat("MM").format(mon.getTime());
		String month = new java.text.SimpleDateFormat("MM").format(mon.getTime());
		
		List<MealDTO> list = Ssv.bestOp(b_month, school);
		m.addAttribute("bestOp", list);
		m.addAttribute("b_month", b_month);
		m.addAttribute("month", month);
		m.addAttribute("school", school);
		m.addAttribute("parent_email", email);
		m.addAttribute("payment", pm);
		System.out.println("설문조사 페이지 : " + b_month + " : " + month + " : " + school + " : " + email + " : " + pm);

		return "student/research";
	}
	
	// 설문조사 결과 저장
	@RequestMapping("researchResult")
	public String reserchResult(String b_month, String month, String email, String school, String payment, ChartDTO dto) {
		int result = Ssv.researchInsert(dto);
		System.out.println("설문조사 결과 저장 : " + b_month + " : " + month + " : " + email + " : " + school + " : " + payment);
		return "forward:/sdt/payHome";
	}
	
	// 결제 페이지
	@RequestMapping("payHome")
	public String payHome(String month, String school, String payment, Model m) {
		int pay = Integer.parseInt(payment);
		
		m.addAttribute("school", school);
		m.addAttribute("month", month);
		m.addAttribute("pay", pay);
		System.out.println("결제 페이지 : " + month + " : " + school +" : " + payment);

		return "student/payment";
	}
	
	
	@RequestMapping("payInfo")
	public String payInfo(PayDTO dto) {
		int result = Ssv.payInsert(dto);
		System.out.println("결제 정보 저장");
		return "redirect:/";
	}
	
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
