package kh.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.MealDAO;
import kh.spring.dto.MealDTO;

@Service
public class MealService {
	
	@Autowired
	private MealDAO dao;
	
	// 식단 추가
	public void addMeal(MealDTO dto, MultipartFile file, String realPath)  throws Exception {
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {
			filesPath.mkdir();
		}
		String oriName = file.getOriginalFilename();
		String sysName = UUID.randomUUID().toString().replace("-", "") + "_" + oriName;
		file.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
		
		String str = dto.getMeal_date().toString();
		String month = str.substring(5, 7);
		System.out.println(str + ", " + month);
		
		dto.setMonth(month);
		dto.setOriName(oriName);
		dto.setSysName(sysName);
		
		if(dto.getMenu3() == null) {
			dto.setMenu3("");
		}
		if(dto.getMenu4() == null) {
			dto.setMenu4("");
		}
		if(dto.getMenu5() == null) {
			dto.setMenu5("");
		}
		if(dto.getMenu6() == null) {
			dto.setMenu6("");
		}

		dao.insert(dto);
	}
	
	// 본인이 등록한 식단 총 개수
	public int totalMeal(String writer) {
		int totalPageCount = 0;
		if(dao.listCount(writer) % 5 > 0) {
			totalPageCount = dao.listCount(writer) / 5 + 1;
		}else {
			totalPageCount = dao.listCount(writer) / 5;
		}
		return totalPageCount;
	}
	
	// 처음에 가지고 갈 '최근저장식단'
	public List<MealDTO> mealList(String writer, String strpageNum) {
		final int page_row_count = 5;
		
		int pageNum = Integer.parseInt(strpageNum);
		
		int start = ((pageNum - 1) * page_row_count) + 1;
		int end = pageNum * page_row_count;
		System.out.println(start + " : " + end);
		
		Map<String, Object> param = new HashMap<>();
		param.put("writer", writer);
		param.put("start", start);
		param.put("end", end);
		
		System.out.println(writer);
		
		List<MealDTO> list = dao.selectList(param);
		
		return list;
	}
	
	// db저장되어있는 식단 엑셀 다운로드
	public void excelDownload(String month, String school, HttpServletResponse response) throws IOException {		
		Workbook wb = new XSSFWorkbook();
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
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=" + month + "월 " + school + " 식단표.xlsx");

		// Excel File Output
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	// 엑셀에 저장되어 있는 식단 db에 업로드
	
	
	
	// 검색
	public List<MealDTO> search(String keyword) {
		return dao.search(keyword);
	}
}
