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
	
	public int insert(MealDTO dto) {
		return mybatis.insert("Meal.insert", dto);
	}
	
	public List<MealDTO> selectList(Map<String, Object> param) { // 5개 리스트 가져오기
		return mybatis.selectList("Meal.selectList", param);
	}
	
	public int listCount(String writer) {
		return mybatis.selectOne("Meal.listCount", writer);
	}
}
