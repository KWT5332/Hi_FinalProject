package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.ChartDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ChartService;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@Autowired
	private ChartService cserve;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("researchHome")
	public String researchHome() {
		return "research";
	}

	@RequestMapping("chartHome")
	public String chartHome(Model m) {
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		ChartDTO cdto = new ChartDTO();
		m.addAttribute("cdto", cdto);
		
		System.out.println(mdto.getEmail());
		System.out.println(cdto.getParent_email());
		
		
		int feed01 = cserve.feed01();
		m.addAttribute("feed01", feed01);
		
		int feed02= cserve.feed02();
		m.addAttribute("feed02", feed02);
		
		int feed03 = cserve.feed03();
		m.addAttribute("feed03", feed03);
		
		int feed04 = cserve.feed04();
		m.addAttribute("feed04", feed04);
		
		int feed05 = cserve.feed05();
		m.addAttribute("feed05", feed05);
		
		// best menu
		int best01 = cserve.best01();
		m.addAttribute("best01", best01);
		
		int best02 = cserve.best02();
		m.addAttribute("best02", best02);
		
		int best03 = cserve.best03();
		m.addAttribute("best03", best03);
		
		int best04 = cserve.best04();
		m.addAttribute("best04", best04);
		
		int best05 = cserve.best05();
		m.addAttribute("best05", best05);
		
		// worst menu
		int worst01 = cserve.worst01();
		m.addAttribute("worst01", worst01);
		
		int worst02 = cserve.worst02();
		m.addAttribute("worst02", worst02);
		
		int worst03 = cserve.worst03();
		m.addAttribute("worst03", worst03);
		
		int worst04 = cserve.worst04();
		m.addAttribute("worst04", worst04);
		
		int worst05 = cserve.worst05();
		m.addAttribute("worst05", worst05);
		
		return "stats/chart";
	}

	@RequestMapping("researchResult")
	public String reserchResult(ChartDTO dto) {
		int result = cserve.insert(dto);
		return "redirect:/pay/payHome";
	}
	
}