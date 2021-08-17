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
	
	// feedback
	public int feed01() {
		return cdao.feed01();
	}
	
	public int feed02() {
		return cdao.feed02();
	}
	
	public int feed03() {
		return cdao.feed03();
	}
	
	public int feed04() {
		return cdao.feed04();
	}
	
	public int feed05() {
		return cdao.feed05();
	}
	
	// best menu
	public int best01() {
		return cdao.best01();
	}
	
	public int best02() {
		return cdao.best02();
	}
	
	public int best03() {
		return cdao.best03();
	}
	
	public int best04() {
		return cdao.best04();
	}
	
	public int best05() {
		return cdao.best05();
	}
	
	
	// worst menu
	public int worst01() {
		return cdao.worst01();
	}
	
	public int worst02() {
		return cdao.worst02();
	}
	
	public int worst03() {
		return cdao.worst03();
	}
	
	public int worst04() {
		return cdao.worst04();
	}
	
	public int worst05() {
		return cdao.worst05();
	}
	
}
