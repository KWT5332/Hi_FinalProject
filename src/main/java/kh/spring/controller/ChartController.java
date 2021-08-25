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
import kh.spring.service.ChartService;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@Autowired
	private ChartService Csv;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("chartHome")
	public String chartHome(Model m) {
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		String parent_email = mdto.getEmail();
		String school = mdto.getSchool();
		
		System.out.println(school + parent_email);
		
		// 기타 의견
		List<ChartDTO> list = Csv.selectEtc(parent_email);
		m.addAttribute("etcList", list);
		
		// 한달 전 날짜
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.MONTH , -1);
		String month = new java.text.SimpleDateFormat("MM").format(mon.getTime());
		System.out.println(month);
//				
//		List<MealDTO> bestList = Csv.bestList(b_month);
//		m.addAttribute("bestList", bestList);
		
		List<PayDTO> payList = Csv.payList(school);
		m.addAttribute("payList", payList);
		
		// 결제인원
		int allStd = Csv.allStd(school);
		m.addAttribute("allStd", allStd);
		
		int allPay = Csv.allPay(school, month);
		m.addAttribute("allPay", allPay);
		
		// feedback
		int feed01 = Csv.feed01(parent_email, month);
		m.addAttribute("feed01", feed01);
		
		int feed02= Csv.feed02(parent_email, month);
		m.addAttribute("feed02", feed02);
		
		int feed03 = Csv.feed03(parent_email, month);
		m.addAttribute("feed03", feed03);
		
		int feed04 = Csv.feed04(parent_email, month);
		m.addAttribute("feed04", feed04);
		
		int feed05 = Csv.feed05(parent_email, month);
		m.addAttribute("feed05", feed05);
		
		// taste
		int taste01 = Csv.taste01(parent_email, month);
		m.addAttribute("taste01", taste01);
		
		int taste02 = Csv.taste02(parent_email, month);
		m.addAttribute("taste02", taste02);
		
		int taste03 = Csv.taste03(parent_email, month);
		m.addAttribute("taste03", taste03);
		
		// amount
		int amount01 = Csv.amount01(parent_email, month);
		m.addAttribute("amount01", amount01);
		
		int amount02 = Csv.amount02(parent_email, month);
		m.addAttribute("amount02", amount02);
		
		int amount03 = Csv.amount03(parent_email, month);
		m.addAttribute("amount03", amount03);
		
		int amount04 = Csv.amount04(parent_email, month);
		m.addAttribute("amount04", amount04);
		
		int amount05 = Csv.amount05(parent_email, month);
		m.addAttribute("amount05", amount05);
		
		// menu
		String menu01 = Csv.menu01(parent_email);
		String menu02 = Csv.menu02(parent_email);
		String menu03 = Csv.menu03(parent_email);
		String menu04 = Csv.menu04(parent_email);
		String menu05 = Csv.menu05(parent_email);
		String menu06 = Csv.menu06(parent_email);
		String menu07 = Csv.menu07(parent_email);
		String menu08 = Csv.menu08(parent_email);
		String menu09 = Csv.menu09(parent_email);
		String menu10 = Csv.menu10(parent_email);
		String menu11 = Csv.menu11(parent_email);
		String menu12 = Csv.menu12(parent_email);
		String menu13 = Csv.menu13(parent_email);
		String menu14 = Csv.menu14(parent_email);
		String menu15 = Csv.menu15(parent_email);
		String menu16 = Csv.menu16(parent_email);
		String menu17 = Csv.menu17(parent_email);
		String menu18 = Csv.menu18(parent_email);
		String menu19 = Csv.menu19(parent_email);
		String menu20 = Csv.menu20(parent_email);
		String menu21 = Csv.menu21(parent_email);
		String menu22 = Csv.menu22(parent_email);
		String menu23 = Csv.menu23(parent_email);
		String menu24 = Csv.menu24(parent_email);
		
		m.addAttribute("menu01", menu01);
		m.addAttribute("menu02", menu02);
		m.addAttribute("menu03", menu03);
		m.addAttribute("menu04", menu04);
		m.addAttribute("menu05", menu05);
		m.addAttribute("menu06", menu06);
		m.addAttribute("menu07", menu07);
		m.addAttribute("menu08", menu08);
		m.addAttribute("menu09", menu09);
		m.addAttribute("menu10", menu10);
		m.addAttribute("menu11", menu11);
		m.addAttribute("menu12", menu12);
		m.addAttribute("menu13", menu13);
		m.addAttribute("menu14", menu14);
		m.addAttribute("menu15", menu15);
		m.addAttribute("menu16", menu16);
		m.addAttribute("menu17", menu17);
		m.addAttribute("menu18", menu18);
		m.addAttribute("menu19", menu19);
		m.addAttribute("menu20", menu20);
		m.addAttribute("menu21", menu21);
		m.addAttribute("menu22", menu22);
		m.addAttribute("menu23", menu23);
		m.addAttribute("menu24", menu24);

		
		//bestmenu
		int best01 = Csv.best01(parent_email);
		int best02 = Csv.best02(parent_email);
		int best03 = Csv.best03(parent_email);
		int best04 = Csv.best04(parent_email);
		int best05 = Csv.best05(parent_email);
		int best06 = Csv.best06(parent_email);
		int best07 = Csv.best07(parent_email);
		int best08 = Csv.best08(parent_email);
		int best09 = Csv.best09(parent_email);
		int best10 = Csv.best10(parent_email);
		int best11 = Csv.best11(parent_email);
		int best12 = Csv.best12(parent_email);
		int best13 = Csv.best13(parent_email);
		int best14 = Csv.best14(parent_email);
		int best15 = Csv.best15(parent_email);
		int best16 = Csv.best16(parent_email);
		int best17 = Csv.best17(parent_email);
		int best18 = Csv.best18(parent_email);
		int best19 = Csv.best19(parent_email);
		int best20 = Csv.best20(parent_email);
		int best21 = Csv.best21(parent_email);
		int best22 = Csv.best22(parent_email);
		int best23 = Csv.best23(parent_email);
		int best24 = Csv.best24(parent_email);
		
		m.addAttribute("best01", best01);
		m.addAttribute("best02", best02);
		m.addAttribute("best03", best03);
		m.addAttribute("best04", best04);
		m.addAttribute("best05", best05);
		m.addAttribute("best06", best06);
		m.addAttribute("best07", best07);
		m.addAttribute("best08", best08);
		m.addAttribute("best09", best09);
		m.addAttribute("best10", best10);
		m.addAttribute("best11", best11);
		m.addAttribute("best12", best12);
		m.addAttribute("best13", best13);
		m.addAttribute("best14", best14);
		m.addAttribute("best15", best15);
		m.addAttribute("best16", best16);
		m.addAttribute("best17", best17);
		m.addAttribute("best18", best18);
		m.addAttribute("best19", best19);
		m.addAttribute("best20", best20);
		m.addAttribute("best21", best21);
		m.addAttribute("best22", best22);
		m.addAttribute("best23", best23);
		m.addAttribute("best24", best24);

		
		
		return "stats/chart";
	}
	
}