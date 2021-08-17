package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.ChartDTO;

@Component
public class ChartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 설문조사 결과 저장
	public int insert(ChartDTO dto) {
		return mybatis.insert("Chart.insert", dto);
	}
	
	
	public List<ChartDTO> selectAll(){
		return mybatis.selectList("Chart.selectAll");
	}
	
	// feedback counting
	public int feed01() {
		return mybatis.selectOne("Chart.feed01");
	}

	public int feed02() {
		return mybatis.selectOne("Chart.feed02");
	}
	
	public int feed03() {
		return mybatis.selectOne("Chart.feed03");
	}
	
	public int feed04() {
		return mybatis.selectOne("Chart.feed04");
	}
	
	public int feed05() {
		return mybatis.selectOne("Chart.feed05");
	}
	
	
	// best menu counting
	public int best01() {
		return mybatis.selectOne("Chart.best01");
	}
	
	public int best02() {
		return mybatis.selectOne("Chart.best02");
	}
	
	public int best03() {
		return mybatis.selectOne("Chart.best03");
	}
	
	public int best04() {
		return mybatis.selectOne("Chart.best04");
	}
	
	public int best05() {
		return mybatis.selectOne("Chart.best05");
	}
	
	// worst menu counting
	public int worst01() {
		return mybatis.selectOne("Chart.worst01");
	}
	
	public int worst02() {
		return mybatis.selectOne("Chart.worst02");
	}
	
	public int worst03() {
		return mybatis.selectOne("Chart.worst03");
	}
	
	public int worst04() {
		return mybatis.selectOne("Chart.worst04");
	}
	
	public int worst05() {
		return mybatis.selectOne("Chart.worst05");
	}
}
