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
	
	// 급식비 인원
	public int allStd(String school) {
		int result = mybatis.selectOne("Chart.all", school);
		System.out.println(school + " : " + result);
		return result;
	}
	
	public int allPay(String school) {
		int result = mybatis.selectOne("Chart.pay", school);
		System.out.println(school + " : " + result);
		return result;
	}
	
	
	// feedback counting
	public int feed01(String parent_email) {
		return mybatis.selectOne("Chart.feed01", parent_email);
	}

	public int feed02(String parent_email) {
		return mybatis.selectOne("Chart.feed02", parent_email);
	}
	
	public int feed03(String parent_email) {
		return mybatis.selectOne("Chart.feed03", parent_email);
	}
	
	public int feed04(String parent_email) {
		return mybatis.selectOne("Chart.feed04", parent_email);
	}
	
	public int feed05(String parent_email) {
		return mybatis.selectOne("Chart.feed05", parent_email);
	}
	
	
	// best menu counting
	public int best01(String parent_email) {
		return mybatis.selectOne("Chart.best01", parent_email);
	}
	
	public int best02(String parent_email) {
		return mybatis.selectOne("Chart.best02", parent_email);
	}
	
	public int best03(String parent_email) {
		return mybatis.selectOne("Chart.best03", parent_email);
	}
	
	public int best04(String parent_email) {
		return mybatis.selectOne("Chart.best04", parent_email);
	}
	
	public int best05(String parent_email) {
		return mybatis.selectOne("Chart.best05", parent_email);
	}
	
	// worst menu counting
	public int worst01(String parent_email) {
		return mybatis.selectOne("Chart.worst01", parent_email);
	}
	
	public int worst02(String parent_email) {
		return mybatis.selectOne("Chart.worst02", parent_email);
	}
	
	public int worst03(String parent_email) {
		return mybatis.selectOne("Chart.worst03", parent_email);
	}
	
	public int worst04(String parent_email) {
		return mybatis.selectOne("Chart.worst04", parent_email);
	}
	
	public int worst05(String parent_email) {
		return mybatis.selectOne("Chart.worst05", parent_email);
	}
}
