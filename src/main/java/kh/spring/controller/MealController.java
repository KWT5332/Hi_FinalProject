package kh.spring.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.config.XSSFillterConfig;
import kh.spring.dto.MealDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.MealService;

@Controller
@RequestMapping("/meal")
public class MealController {
	
	@Autowired
	private MealService service;

	@Autowired
	private HttpSession session;

	@RequestMapping("calendar") 
	public String calendar() {
		System.out.println("캘린더");
		return "meal/calendar";
	}
	
	@RequestMapping("Main") // 식단관리 메인페이지
	public String Main(Model model) {
		System.out.println("식단관리 메인페이지");
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		Date date = new Date(); // import java.util.Date;
		String month = sdf.format(date);
		System.out.println(month);
		
		List<MealDTO> list = service.getAllList(month);
		model.addAttribute("list", list);
		
		return "meal/main";
	}
	
	@RequestMapping("addmeal") // 식단추가페이지로 넘어가기(5개 가지고 가기)
	public String addmeal(Model model) {
		System.out.println("식단추가페이지로 가기");
		
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		
		int totalPageCount = service.totalMeal(dto.getName());
		List<MealDTO> list = service.mealList(dto.getName(), "1");
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("list",list);
		
		System.out.println(totalPageCount);
		return "meal/addMeal";
	}
	
	// 무한 스크롤, 최근 저장한 식단 불러오기
	@ResponseBody
	@RequestMapping(value="historyList", produces="text/html;charset=utf8")
	public String historyList(String pageNum, Model model) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		
//		Gson g = new Gson();
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();	
		
		List<MealDTO> list = service.mealList(dto.getName(), pageNum);
				
		String result = g.toJson(list);
		
		return String.valueOf(result);
	}
	
	// 식단추가
	@RequestMapping("addmealProc")
	public String addmealProc(MealDTO dto, MultipartFile file) throws Exception {
		System.out.println("식단추가");
		
		String realPath = session.getServletContext().getRealPath("meal_img");
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		dto.setWriter(mdto.getName());
		dto.setSchool(mdto.getSchool());
		
		dto.setMenu1(XSSFillterConfig.XSSFilter(dto.getMenu1()));
		dto.setMenu2(XSSFillterConfig.XSSFilter(dto.getMenu2()));
		dto.setMenu3(XSSFillterConfig.XSSFilter(dto.getMenu3()));
		dto.setMenu4(XSSFillterConfig.XSSFilter(dto.getMenu4()));
		dto.setMenu5(XSSFillterConfig.XSSFilter(dto.getMenu5()));
		dto.setMenu6(XSSFillterConfig.XSSFilter(dto.getMenu6()));

		service.addMeal(dto, file, realPath); 

		return "redirect:/meal/addmeal";
	}
	
	// 검색
	@RequestMapping("searchlist")
	public String search(String keyword, Model model) {
		String fillter = XSSFillterConfig.XSSFilter(keyword);
		System.out.println("검색 : " + fillter);
		
		List<MealDTO> list = service.search(fillter);
		
		model.addAttribute("keyword", fillter); 
		model.addAttribute("list", list);
		
		return "meal/search"; 
	}
	
}
