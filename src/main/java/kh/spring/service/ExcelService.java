package kh.spring.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MealDAO;
import kh.spring.dto.MealDTO;
import kh.spring.dto.MemberDTO;

@Service
public class ExcelService {
	
	@Autowired
	private MealDAO dao;
	
	// db저장되어있는 식단 엑셀 다운로드
	public void excelDownload(String month, String school, HttpServletResponse response) throws IOException {		
		XSSFWorkbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet(month + "월 식단표");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		// 공통 스타일
		CellStyle commonStyle = wb.createCellStyle(); // title 셀 스타일 설정
		commonStyle.setAlignment(HorizontalAlignment.CENTER); // 가운데 정렬
		commonStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		// title
		Font font = wb.createFont();
		font.setBold(true); // 굵은 글씨
		font.setFontHeightInPoints((short)14);
		
		CellStyle titleStyle = wb.createCellStyle(); // title 셀 스타일 설정
		titleStyle.setAlignment(HorizontalAlignment.CENTER); // 가운데 정렬
		titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		titleStyle.setFont(font);
		
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 6)); // 셀병함
		
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellStyle(titleStyle); // title 셀 스타일 적용
		cell.setCellValue(month + "월 " + school + " 식단표");
		
		// 빈행 추가
		sheet.createRow(rowNum++); 
		row = sheet.createRow(rowNum++); 
		
		// Header
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellStyle(commonStyle);
		cell.setCellValue("날짜");
		cell = row.createCell(1);
		cell.setCellStyle(commonStyle);
		cell.setCellValue("메뉴1");		
		cell = row.createCell(2);
		cell.setCellStyle(commonStyle);
		cell.setCellValue("메뉴2");		
		cell = row.createCell(3);
		cell.setCellStyle(commonStyle);
		cell.setCellValue("메뉴3");		
		cell = row.createCell(4);
		cell.setCellStyle(commonStyle);
		cell.setCellValue("메뉴4");		
		cell = row.createCell(5);
		cell.setCellStyle(commonStyle);
		cell.setCellValue("메뉴5");		
		cell = row.createCell(6);
		cell.setCellStyle(commonStyle);
		cell.setCellValue("메뉴6");

		// Body
		CellStyle dateStyle = wb.createCellStyle(); // 날짜 셀 스타일 설정
		dateStyle.setDataFormat(wb.getCreationHelper().createDataFormat().getFormat("yy/mm/dd (aaa)")); // 수요일 하고싶으면 aaaa 
		dateStyle.setAlignment(HorizontalAlignment.CENTER); // 가운데 정렬
		dateStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		Map<String, String> param = new HashMap<>();
		param.put("month", month);
		param.put("school", school);

		List<MealDTO> list = dao.excelDownloadList(param);
		
		for (MealDTO dto : list) {
			row = sheet.createRow(rowNum++);
			
			cell = row.createCell(0);
			cell.setCellStyle(dateStyle);
			cell.setCellValue(dto.getMeal_date());
			
			cell = row.createCell(1);
			cell.setCellStyle(commonStyle);
			cell.setCellValue(dto.getMenu1());
			cell = row.createCell(2);
			cell.setCellStyle(commonStyle);
			cell.setCellValue(dto.getMenu2());
			cell = row.createCell(3);
			cell.setCellStyle(commonStyle);
			cell.setCellValue(dto.getMenu3());
			cell = row.createCell(4);
			cell.setCellStyle(commonStyle);
			cell.setCellValue(dto.getMenu4());
			cell = row.createCell(5);
			cell.setCellStyle(commonStyle);
			cell.setCellValue(dto.getMenu5());
			cell = row.createCell(6);
			cell.setCellStyle(commonStyle);
			cell.setCellValue(dto.getMenu6());
		}
		
		sheet.setColumnWidth(0, 4000);
		for (int i=1;i<7;i++) {
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + (short)1024); 
			//이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에 (short)512를 추가해 주니 한결 보기 나아졌다.
		}
		
		// 컨텐츠 타입과 파일명 지정
		response.reset();
		response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(month + "월 " + school + " 식단표", "UTF-8") + ".xlsx");
		response.setContentType("ms-vnd/excel");
		
		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	
	// 엑셀 업로드양식 다운
	public void excelform(HttpServletResponse response) throws IOException {		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("sheet1");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		// 공통 스타일
		CellStyle style = wb.createCellStyle(); // title 셀 스타일 설정
		style.setAlignment(HorizontalAlignment.CENTER); // 가운데 정렬
		style.setVerticalAlignment(VerticalAlignment.CENTER);

		// title
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("날짜는 2021-07-21 (월) 형식으로 작성, 파일이름은 07월 식단표로 작성 부탁드립니다.");
		
		// 빈행 추가
		sheet.createRow(rowNum++); 
		//row = sheet.createRow(rowNum++); 
		
		// Header
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellStyle(style);
		cell.setCellValue("날짜");
		cell = row.createCell(1);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴1");		
		cell = row.createCell(2);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴2");		
		cell = row.createCell(3);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴3");		
		cell = row.createCell(4);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴4");		
		cell = row.createCell(5);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴5");		
		cell = row.createCell(6);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴6");
		
		// 컨텐츠 타입과 파일명 지정
		response.reset();
		response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("식단 업로드 양식", "UTF-8") + ".xlsx");
		response.setContentType("ms-vnd/excel");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	// 엑셀에 저장되어 있는 식단 db에 업로드
//	public int readExcelupload(MemberDTO dto, String fileName) {
		
//		List<MealDTO> list = new ArrayList<>();
//		
//		try {
//			FileInputStream fis = new FileInputStream(fileName);
//			Workbook workbook = null; // 초기화
//			
//			workbook = new XSSFWorkbook(fis);
//			
//			int numberOfSheets = workbook.getNumberOfSheets(); // 시트의 갯수 추출
//			
//			 for (int i = 0; i < numberOfSheets; i++) {
//				 // 현재 sheet 반환
//				 Sheet sheet = (XSSFSheet) workbook.getSheetAt(i);
//	                
//	            curRow = curSheet.getRow(3); // 두번째 행 추출
//	 
//	 // 두번째 행의 첫번째 Cell 값 가져오기
//	                String wlobscd = curRow.getCell(0).getStringCellValue();
//				 Sheet sheet = workbook.getSheetAt(i);
//			 }
//			
//		}catch(Exception e) {
//			
//		}
//
//		return dao.excelupload(list);
//	}
}
