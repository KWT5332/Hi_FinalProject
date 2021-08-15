package kh.spring.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	public void addMeal(MealDTO dto, MultipartFile file, String realPath) throws Exception {
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
	
	// '최근저장식단'
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

	// 검색
	public List<MealDTO> search(String keyword) {
		return dao.search(keyword);
	}
}
