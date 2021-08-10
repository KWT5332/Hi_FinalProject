package kh.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

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
	
	@RequestMapping("Main") // 식단관리 메인페이지
	public String Main() {
		return "meal/main";
	}
	
	@RequestMapping("addmeal") // 식단추가페이지로 넘어가기(5개 가지고 가기)
	public String addmeal(Model model) {
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
		
		Gson g = new Gson();
		
		List<MealDTO> list = service.mealList(dto.getName(), pageNum);
		String result = g.toJson(list);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("addmealProc") // 식단추가
	public String addmealProc(MealDTO dto, MultipartFile file) throws Exception {
		String realPath = session.getServletContext().getRealPath("files");
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		dto.setWriter(mdto.getName());
		dto.setSchool(mdto.getSchool());

		service.addMeal(dto, file, realPath); 

		return "redirect:/meal/addmeal";
	}
	
	// db저장되어있는 식단 엑셀 다운로드
	@RequestMapping("excelDowload")
	public void excelDownload(String month, HttpServletResponse response) throws IOException {
		MealDTO mdto = (MealDTO)session.getAttribute("login");
		String school = mdto.getSchool();
		
		service.excelDownload(month, school, response);
	}
	
	@RequestMapping("searchlist")
	public String search(String keyword, Model model) {
		System.out.println(keyword);
		List<MealDTO> list = service.search(keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		
		return "meal/search";
	}
}
