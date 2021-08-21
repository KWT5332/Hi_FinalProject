package kh.spring.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		cell.setCellValue("월은 06,11 형식, 날짜는 2021-07-21 (월) 형식으로 작성 부탁드립니다. 메뉴는 최소 2개부터 최대 6개까지만 등록가능합니다.");
		
		// 빈행 추가
		sheet.createRow(rowNum++); 
		//row = sheet.createRow(rowNum++); 
		
		// Header
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellStyle(style);
		cell.setCellValue("월");
		cell = row.createCell(1);
		cell.setCellStyle(style);
		cell.setCellValue("날짜");
		cell = row.createCell(2);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴1");		
		cell = row.createCell(3);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴2");		
		cell = row.createCell(4);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴3");		
		cell = row.createCell(5);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴4");		
		cell = row.createCell(6);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴5");		
		cell = row.createCell(7);
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
	public String excelupload(MemberDTO dto, MultipartFile file, String realPath) throws Exception {
		System.out.println("service");
		File filesPath = new File(realPath);
		if(!filesPath.exists()) {
			filesPath.mkdir();
		}
		String oriName = file.getOriginalFilename();
		String sysName = UUID.randomUUID().toString().replace("-", "") + "_" + oriName;
		file.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
		
		List<MealDTO> list = readExcel(dto, filesPath.getAbsolutePath()+"/"+sysName);
		String[] month = new String[1];
		
		for(MealDTO m : list) {
			month[0] = m.getMonth();
			System.out.println(m.getMonth() + " : " + m.getMeal_date() + " : " + m.getSchool() + " : " 
					+ m.getWriter() + " : " + m.getMenu1() + " : " + m.getMenu2() + " : " + m.getMenu3()
					+ " : " + m.getMenu4() + " : " + m.getMenu5() + " : " + m.getMenu6() + " : " + m.getOriName()
					+ " : " + m.getSysName() + "끝"); 
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);

		dao.excelupload(map);
		
		return month[0];
	}
	
	// 엑셀 읽는 코드
	private List<MealDTO> readExcel(MemberDTO m, String filePath) throws Exception {
		System.out.println("readExcel");
		List<MealDTO> list = new ArrayList<>();

		FileInputStream fis = new FileInputStream(filePath);

		Workbook workbook = null; // 초기화

		workbook = new XSSFWorkbook(fis);

		XSSFRow curRow;

		XSSFSheet sheet = (XSSFSheet) workbook.getSheetAt(0);
		int totalRowNum = sheet.getPhysicalNumberOfRows();
		
		//			int numberOfSheets = workbook.getNumberOfSheets(); // 시트의 갯수 추출

		//			 for (int i = 0; i < numberOfSheets; i++) {
		//				 // 현재 sheet 반환
		//				 curSheet = (XSSFSheet) workbook.getSheetAt(i);

		//4번째 행(row)부터 0~7셀(cell)을 1개의 dto에 담아야 한다. 
		Loop1 : for(int i=3;i<totalRowNum;i++) { // 0부터 시작, 4번째 행(row) 추출
			MealDTO dto = new MealDTO();
			curRow = sheet.getRow(i); 

			if(curRow.getCell(4) == null || curRow.getCell(4).equals("")) {
				break Loop1;
			}else {
				dto.setMonth(curRow.getCell(0).getStringCellValue());

				// String -> sql.date로 변경해서 dto.getMeal_date에 담기	
				String Mealdate = curRow.getCell(1).getStringCellValue();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date(sdf.parse(Mealdate).getTime());
				dto.setMeal_date(date);
				
				dto.setSchool(m.getSchool());
				dto.setWriter(m.getName());
				
				// menu1,2는 무조건 등록
				dto.setMenu1(curRow.getCell(2).getStringCellValue());
				dto.setMenu2(curRow.getCell(3).getStringCellValue());

				if(curRow.getCell(4) == null || curRow.getCell(4).equals("")) {
					dto.setMenu3("");
				}else {dto.setMenu3(curRow.getCell(4).getStringCellValue());}

				if(curRow.getCell(5) == null || curRow.getCell(5).equals("")) {
					dto.setMenu4("");
				}else {dto.setMenu4(curRow.getCell(5).getStringCellValue());}

				if(curRow.getCell(6) == null || curRow.getCell(6).equals("")) {
					dto.setMenu5("");
				}else {dto.setMenu5(curRow.getCell(6).getStringCellValue());}

				if(curRow.getCell(7) == null || curRow.getCell(7).equals("")) {
					dto.setMenu6("");
				}else {dto.setMenu6(curRow.getCell(7).getStringCellValue());}

				dto.setOriName("");
				dto.setSysName("");

				list.add(dto);
			}
		}
		fis.close();
		
		return list;
	}
}
