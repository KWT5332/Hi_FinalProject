package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChartDAO;
import kh.spring.dto.ChartDTO;

@Service
public class ChartService {

	@Autowired
	private ChartDAO cdao;
	
	public int insert(ChartDTO dto) {
		return cdao.insert(dto);
	}
	
	public List<ChartDTO> selectAll(){
		return cdao.selectAll();
	}
	
	public int allStd(String school) {
		return cdao.allStd(school);
	}
	
	public int allPay(String school) {
		return cdao.allPay(school);
	}
	
	
	// feedback
	public int feed01(String parent_email) {
		return cdao.feed01(parent_email);
	}
	
	public int feed02(String parent_email) {
		return cdao.feed02(parent_email);
	}
	
	public int feed03(String parent_email) {
		return cdao.feed03(parent_email);
	}
	
	public int feed04(String parent_email) {
		return cdao.feed04(parent_email);
	}
	
	public int feed05(String parent_email) {
		return cdao.feed05(parent_email);
	}
	
	// best menu
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
	
	
	// worst menu
	public int worst01(String parent_email) {
		return cdao.worst01(parent_email);
	}
	
	public int worst02(String parent_email) {
		return cdao.worst02(parent_email);
	}
	
	public int worst03(String parent_email) {
		return cdao.worst03(parent_email);
	}
	
	public int worst04(String parent_email) {
		return cdao.worst04(parent_email);
	}
	
	public int worst05(String parent_email) {
		return cdao.worst05(parent_email);
	}
	
}
