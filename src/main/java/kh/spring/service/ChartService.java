package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChartDAO;
import kh.spring.dao.PayDAO;
import kh.spring.dto.ChartDTO;
import kh.spring.dto.MealDTO;
import kh.spring.dto.PayDTO;

@Service
public class ChartService {

	@Autowired
	private ChartDAO cdao;
	
	@Autowired
	private PayDAO pdao;
	
	// 기타 의견
	public List<ChartDTO> selectEtc(String parent_email){
		return cdao.selectEtc(parent_email);
	}
	
	// 베스트메뉴 셀렉트 옵션
	public List<MealDTO> bestList(String b_month){
		return cdao.bestOp(b_month);
	}
		
	public List<PayDTO> payList(){
		return pdao.payList();
	}
	
	// 급식비 인원
	public int allStd(String school) {
		return cdao.allStd(school);
	}
	
	public int allPay(String school, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("school", school);
		param.put("month", month);
		return cdao.allPay(param);
	}
	
//	public int allPay(String school) {
//		return cdao.allPay(school);
//	}
	
	
	// feedback
	public int feed01(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.feed01(param);
	}
	
	public int feed02(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.feed02(param);
	}
	
	public int feed03(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.feed03(param);
	}
	
	public int feed04(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.feed04(param);
	}
	
	public int feed05(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.feed05(param);
	}
	
	
	// taste
	public int taste01(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.taste01(param);
	}
	
	public int taste02(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.taste02(param);
	}
	
	public int taste03(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.taste03(param);
	}
	
	
	// amount
	public int amount01(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.amount01(param);
	}
	
	public int amount02(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.amount02(param);
	}
	
	public int amount03(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.amount03(param);
	}
	
	public int amount04(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.amount04(param);
	}
	
	public int amount05(String parent_email, String month) {
		Map<String, String> param = new HashMap<>();
		param.put("parent_email", parent_email);
		param.put("month", month);
		return cdao.amount05(param);
	}
	
	
	// bestmenu
	public String menu01(String parent_email) {
		return cdao.menu01(parent_email);
	}
	public String menu02(String parent_email) {
		return cdao.menu02(parent_email);
	}
	public String menu03(String parent_email) {
		return cdao.menu03(parent_email);
	}
	public String menu04(String parent_email) {
		return cdao.menu04(parent_email);
	}
	public String menu05(String parent_email) {
		return cdao.menu05(parent_email);
	}
	public String menu06(String parent_email) {
		return cdao.menu06(parent_email);
	}
	public String menu07(String parent_email) {
		return cdao.menu07(parent_email);
	}
	public String menu08(String parent_email) {
		return cdao.menu08(parent_email);
	}
	public String menu09(String parent_email) {
		return cdao.menu09(parent_email);
	}
	public String menu10(String parent_email) {
		return cdao.menu10(parent_email);
	}
	public String menu11(String parent_email) {
		return cdao.menu11(parent_email);
	}
	public String menu12(String parent_email) {
		return cdao.menu12(parent_email);
	}
	public String menu13(String parent_email) {
		return cdao.menu13(parent_email);
	}
	public String menu14(String parent_email) {
		return cdao.menu14(parent_email);
	}
	public String menu15(String parent_email) {
		return cdao.menu15(parent_email);
	}
	public String menu16(String parent_email) {
		return cdao.menu16(parent_email);
	}
	public String menu17(String parent_email) {
		return cdao.menu17(parent_email);
	}
	public String menu18(String parent_email) {
		return cdao.menu18(parent_email);
	}
	public String menu19(String parent_email) {
		return cdao.menu19(parent_email);
	}
	public String menu20(String parent_email) {
		return cdao.menu20(parent_email);
	}
	public String menu21(String parent_email) {
		return cdao.menu21(parent_email);
	}
	public String menu22(String parent_email) {
		return cdao.menu22(parent_email);
	}
	public String menu23(String parent_email) {
		return cdao.menu23(parent_email);
	}
	public String menu24(String parent_email) {
		return cdao.menu24(parent_email);
	}
	
	
	// bestmenu counting
	public int best01(String parent_email) {
		return cdao.best01(parent_email);
	}
	public int best02(String parent_email) {
		return cdao.best02(parent_email);
	}
	public int best03(String parent_email) {
		return cdao.best03(parent_email);
	}
	public int best04(String parent_email) {
		return cdao.best04(parent_email);
	}
	public int best05(String parent_email) {
		return cdao.best05(parent_email);
	}
	public int best06(String parent_email) {
		return cdao.best06(parent_email);
	}
	public int best07(String parent_email) {
		return cdao.best07(parent_email);
	}
	public int best08(String parent_email) {
		return cdao.best08(parent_email);
	}
	public int best09(String parent_email) {
		return cdao.best09(parent_email);
	}
	public int best10(String parent_email) {
		return cdao.best10(parent_email);
	}
	public int best11(String parent_email) {
		return cdao.best11(parent_email);
	}
	public int best12(String parent_email) {
		return cdao.best12(parent_email);
	}
	public int best13(String parent_email) {
		return cdao.best13(parent_email);
	}
	public int best14(String parent_email) {
		return cdao.best14(parent_email);
	}
	public int best15(String parent_email) {
		return cdao.best15(parent_email);
	}
	public int best16(String parent_email) {
		return cdao.best16(parent_email);
	}
	public int best17(String parent_email) {
		return cdao.best17(parent_email);
	}
	public int best18(String parent_email) {
		return cdao.best18(parent_email);
	}
	public int best19(String parent_email) {
		return cdao.best19(parent_email);
	}
	public int best20(String parent_email) {
		return cdao.best20(parent_email);
	}
	public int best21(String parent_email) {
		return cdao.best21(parent_email);
	}
	public int best22(String parent_email) {
		return cdao.best22(parent_email);
	}
	public int best23(String parent_email) {
		return cdao.best23(parent_email);
	}
	public int best24(String parent_email) {
		return cdao.best24(parent_email);
	}
	
}
