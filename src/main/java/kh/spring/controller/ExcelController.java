package kh.spring.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MealDTO;
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

}
