package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.ChartDTO;
import kh.spring.dto.MealDTO;

@Component
public class ChartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 설문조사 결과 저장
	public int insert(ChartDTO dto) {
		return mybatis.insert("Chart.insert", dto);
	}
	
	// 베스트메뉴 1~5
	public List<ChartDTO> bestList(Map<String, String> param){
		return mybatis.selectList("Chart.bestList", param);
	}
	
	// 베스트메뉴 셀렉트 옵션
	public List<MealDTO> bestOp(String b_month) {
		return mybatis.selectList("Chart.bestOp", b_month);
	}
	
	// 기타 의견
	public List<ChartDTO> selectEtc(String parent_email){
		return mybatis.selectList("Chart.selectEtc", parent_email);
	}
	
	// 급식비 인원
	public int allStd(String school) {
		int result = mybatis.selectOne("Chart.all", school);
		return result;
	}
	public int allPay(Map<String, String> param) {
		int result = mybatis.selectOne("Chart.pay", param);
		return result;
	}
	
	// feedback counting
	public int feed01(Map<String, String> param) {
		return mybatis.selectOne("Chart.feed01", param);
	}

	public int feed02(Map<String, String> param) {
		return mybatis.selectOne("Chart.feed02", param);
	}
	
	public int feed03(Map<String, String> param) {
		return mybatis.selectOne("Chart.feed03", param);
	}
	
	public int feed04(Map<String, String> param) {
		return mybatis.selectOne("Chart.feed04", param);
	}
	
	public int feed05(Map<String, String> param) {
		return mybatis.selectOne("Chart.feed05", param);
	}
	
	
	// taste counting
	public int taste01(Map<String, String> param) {
		return mybatis.selectOne("Chart.taste01", param);
	}
	
	public int taste02(Map<String, String> param) {
		return mybatis.selectOne("Chart.taste02", param);
	}
	
	public int taste03(Map<String, String> param) {
		return mybatis.selectOne("Chart.taste03", param);
	}
	
	
	// amount counting
	public int amount01(Map<String, String> param) {
		return mybatis.selectOne("Chart.amount01", param);
	}
	
	public int amount02(Map<String, String> param) {
		return mybatis.selectOne("Chart.amount02", param);
	}
	
	public int amount03(Map<String, String> param) {
		return mybatis.selectOne("Chart.amount03", param);
	}
	
	public int amount04(Map<String, String> param) {
		return mybatis.selectOne("Chart.amount04", param);
	}
	
	public int amount05(Map<String, String> param) {
		return mybatis.selectOne("Chart.amount05", param);
	}
	
	
//	// bestmenu
//	public String menu01(String parent_email) {
//		return mybatis.selectOne("Chart.menu01", parent_email);
//	}
//	public String menu02(String parent_email) {
//		return mybatis.selectOne("Chart.menu02", parent_email);
//	}
//	public String menu03(String parent_email) {
//		return mybatis.selectOne("Chart.menu03", parent_email);
//	}
//	public String menu04(String parent_email) {
//		return mybatis.selectOne("Chart.menu04", parent_email);
//	}
//	public String menu05(String parent_email) {
//		return mybatis.selectOne("Chart.menu05", parent_email);
//	}
//	public String menu06(String parent_email) {
//		return mybatis.selectOne("Chart.menu06", parent_email);
//	}
//	public String menu07(String parent_email) {
//		return mybatis.selectOne("Chart.menu07", parent_email);
//	}
//	public String menu08(String parent_email) {
//		return mybatis.selectOne("Chart.menu08", parent_email);
//	}
//	public String menu09(String parent_email) {
//		return mybatis.selectOne("Chart.menu09", parent_email);
//	}
//	public String menu10(String parent_email) {
//		return mybatis.selectOne("Chart.menu10", parent_email);
//	}
//	public String menu11(String parent_email) {
//		return mybatis.selectOne("Chart.menu11", parent_email);
//	}
//	public String menu12(String parent_email) {
//		return mybatis.selectOne("Chart.menu12", parent_email);
//	}
//	public String menu13(String parent_email) {
//		return mybatis.selectOne("Chart.menu13", parent_email);
//	}
//	public String menu14(String parent_email) {
//		return mybatis.selectOne("Chart.menu14", parent_email);
//	}
//	public String menu15(String parent_email) {
//		return mybatis.selectOne("Chart.menu15", parent_email);
//	}
//	public String menu16(String parent_email) {
//		return mybatis.selectOne("Chart.menu16", parent_email);
//	}
//	public String menu17(String parent_email) {
//		return mybatis.selectOne("Chart.menu17", parent_email);
//	}
//	public String menu18(String parent_email) {
//		return mybatis.selectOne("Chart.menu18", parent_email);
//	}
//	public String menu19(String parent_email) {
//		return mybatis.selectOne("Chart.menu19", parent_email);
//	}
//	public String menu20(String parent_email) {
//		return mybatis.selectOne("Chart.menu20", parent_email);
//	}
//	public String menu21(String parent_email) {
//		return mybatis.selectOne("Chart.menu21", parent_email);
//	}
//	public String menu22(String parent_email) {
//		return mybatis.selectOne("Chart.menu22", parent_email);
//	}
//	public String menu23(String parent_email) {
//		return mybatis.selectOne("Chart.menu23", parent_email);
//	}
//	public String menu24(String parent_email) {
//		return mybatis.selectOne("Chart.menu24", parent_email);
//	}
//	
//	
//	// bestmenu counting
//	public int best01(String parent_email) {
//		return mybatis.selectOne("Chart.best01", parent_email);
//	}
//	public int best02(String parent_email) {
//		return mybatis.selectOne("Chart.best02", parent_email);
//	}
//	public int best03(String parent_email) {
//		return mybatis.selectOne("Chart.best03", parent_email);
//	}
//	public int best04(String parent_email) {
//		return mybatis.selectOne("Chart.best04", parent_email);
//	}
//	public int best05(String parent_email) {
//		return mybatis.selectOne("Chart.best05", parent_email);
//	}
//	public int best06(String parent_email) {
//		return mybatis.selectOne("Chart.best06", parent_email);
//	}
//	public int best07(String parent_email) {
//		return mybatis.selectOne("Chart.best07", parent_email);
//	}
//	public int best08(String parent_email) {
//		return mybatis.selectOne("Chart.best08", parent_email);
//	}
//	public int best09(String parent_email) {
//		return mybatis.selectOne("Chart.best09", parent_email);
//	}
//	public int best10(String parent_email) {
//		return mybatis.selectOne("Chart.best10", parent_email);
//	}
//	public int best11(String parent_email) {
//		return mybatis.selectOne("Chart.best11", parent_email);
//	}
//	public int best12(String parent_email) {
//		return mybatis.selectOne("Chart.best12", parent_email);
//	}
//	public int best13(String parent_email) {
//		return mybatis.selectOne("Chart.best13", parent_email);
//	}
//	public int best14(String parent_email) {
//		return mybatis.selectOne("Chart.best14", parent_email);
//	}
//	public int best15(String parent_email) {
//		return mybatis.selectOne("Chart.best15", parent_email);
//	}
//	public int best16(String parent_email) {
//		return mybatis.selectOne("Chart.best16", parent_email);
//	}
//	public int best17(String parent_email) {
//		return mybatis.selectOne("Chart.best17", parent_email);
//	}
//	public int best18(String parent_email) {
//		return mybatis.selectOne("Chart.best18", parent_email);
//	}
//	public int best19(String parent_email) {
//		return mybatis.selectOne("Chart.best19", parent_email);
//	}
//	public int best20(String parent_email) {
//		return mybatis.selectOne("Chart.best20", parent_email);
//	}
//	public int best21(String parent_email) {
//		return mybatis.selectOne("Chart.best21", parent_email);
//	}
//	public int best22(String parent_email) {
//		return mybatis.selectOne("Chart.best22", parent_email);
//	}
//	public int best23(String parent_email) {
//		return mybatis.selectOne("Chart.best23", parent_email);
//	}
//	public int best24(String parent_email) {
//		return mybatis.selectOne("Chart.best24", parent_email);
//	}
	
}
