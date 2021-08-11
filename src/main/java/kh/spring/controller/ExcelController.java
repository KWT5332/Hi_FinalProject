package kh.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.MealDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.ExcelService;

@Controller
@RequestMapping("/excel")
public class ExcelController {
	
	@Autowired
	private ExcelService service;
	
	@Autowired
	private HttpSession session;

	
	// db저장되어있는 식단 엑셀 다운로드
	@RequestMapping("excelDowload")
	public void excelDownload(String month, HttpServletResponse response) throws IOException {
		MealDTO mdto = (MealDTO)session.getAttribute("login");
		String school = mdto.getSchool();

		service.excelDownload(month, school, response);
	}
	
	// 엑셀 업로드양식 다운
	@RequestMapping("excelform")
	public void excelform(HttpServletResponse response) throws IOException {
		service.excelform(response);
	}
	
	// 엑셀 업로드
	@ResponseBody
	@RequestMapping(value="excelupload", produces="text/html;charset=utf8")
	public String excelupload(String fileName) throws IOException {
		System.out.println(fileName);
//		Map<String, Object> map = new HashMap<>();
//		
//		MemberDTO dto = (MemberDTO)session.getAttribute("login");
//		
//		Gson g = new Gson();
//		
//		int result = service.excelupload(dto, fileName);
//		String result = g.toJson(list);
//		
//		return String.valueOf(result);
		return "1";
	}
}
