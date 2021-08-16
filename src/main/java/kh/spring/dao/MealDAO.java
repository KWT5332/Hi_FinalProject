package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MealDTO;

@Repository
public class MealDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MealDTO> getAllList(String month){
		return mybatis.selectList("Meal.selectAll", month);
	}
	
	public int insert(MealDTO dto) {
		return mybatis.insert("Meal.insert", dto);
	}
	
	public List<MealDTO> selectList(Map<String, Object> param) { // 최근저장한 식단, 5개 리스트 가져오기
		return mybatis.selectList("Meal.selectList", param);
	}
	
	public int listCount(String writer) {
		return mybatis.selectOne("Meal.listCount", writer);
	}
	
	public List<MealDTO> excelDownloadList(Map<String, String> param) {
		return mybatis.selectList("Meal.excelDownload", param);
	}
	
	public List<MealDTO> search(String keyword) {
		return mybatis.selectList("Meal.search", keyword);
	}
	
	public int excelupload(Map<String, Object> map) {
		return mybatis.insert("Meal.excelupload", map);
	}
}
