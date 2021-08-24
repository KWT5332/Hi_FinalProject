package kh.spring.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ChartDTO;
import kh.spring.dto.MealDTO;
import kh.spring.dto.MemberDTO;
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
	public String researchHome(String month, String payment, Model m) {
		
		// 한달 전 날짜
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.MONTH , -1);
		String monthDate = new java.text.SimpleDateFormat("MM").format(mon.getTime());
		System.out.println(monthDate);
		
		List<MealDTO> list = Ssv.bestOp(monthDate);
		m.addAttribute("bestOp", list);
		
		m.addAttribute("month", month);
		m.addAttribute("payment", payment);
		
		return "student/research";
	}
	
	@RequestMapping("researchResult")
	public String reserchResult(String month, String payment, ChartDTO dto) {
		
		int result = Ssv.researchInsert(dto);
		return "forward:/sdt/payHome";
	}
	
	@RequestMapping("payHome")
	public String payHome(String month, String payment, Model m) {
		
		int pay = Integer.parseInt(payment);
		
		m.addAttribute("month", month);
		m.addAttribute("pay", pay);
		
		System.out.println(month + "월 급식비 : " + pay);
		
		return "student/payment";
	}
	
	@RequestMapping("payInfo")
	public String payInfo(PayDTO dto) {
		int result = Ssv.payInsert(dto);
		return "redirect:/";
	}
	
}
