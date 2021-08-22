package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping("Main") // 식단관리 메인페이지
	public String Main(Model model) {
		System.out.println("식단관리 메인페이지");
		return "meal/main";
	}
	
	@ResponseBody
	@RequestMapping("calendar") // 달력내용 가져오기
	public String calendar(String month,Model model) {
		System.out.println("달력내용 ajax");
		
//		SimpleDateFormat sdf = new SimpleDateFormat("MM");
//		Date date = new Date(); // import java.util.Date;
//		String month = sdf.format(date);
		System.out.println(month);
		
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();	
		
		List<MealDTO> list = service.getAllList(month);
				
		String result = g.toJson(list);
		
		return String.valueOf(result);
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
	@RequestMapping(value="addmealProc", produces="text/html;charset=utf8")
	public String addmealProc(MealDTO dto, MultipartFile file) throws Exception {
		System.out.println("식단추가");
		System.out.println(file);

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
	
	// 수정
	@ResponseBody
	@RequestMapping("isDateOk")
	public String isDateOk(Date meal_date) {
		System.out.println("이 날짜있냐 " + meal_date);

		int result = service.isdateOk(meal_date);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping("update")
	public String update(String meal_date,String menu1,String menu2,String menu3,String menu4,String menu5,String menu6) {
		System.out.println("수정");

		MealDTO dto = new MealDTO();
		dto.setMenu1(XSSFillterConfig.XSSFilter(menu1));
		dto.setMenu2(XSSFillterConfig.XSSFilter(menu2));
		dto.setMenu3(XSSFillterConfig.XSSFilter(menu3));
		dto.setMenu4(XSSFillterConfig.XSSFilter(menu4));
		dto.setMenu5(XSSFillterConfig.XSSFilter(menu5));
		dto.setMenu6(XSSFillterConfig.XSSFilter(menu6));
		
		service.update(meal_date, dto);
		
		return "1";
	}
	
	// 삭제
	@ResponseBody
	@RequestMapping("delete")
	public String delte(String meal_date) {
		System.out.println("삭제");

		service.delete(meal_date);
		
		return "1"; 
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		String realPath = session.getServletContext().getRealPath("meal_img");
		System.out.println(realPath);
		File file = new File(realPath+"/"+fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
