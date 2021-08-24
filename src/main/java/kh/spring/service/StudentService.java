package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ChartDAO;
import kh.spring.dao.PayDAO;
import kh.spring.dto.ChartDTO;
import kh.spring.dto.MealDTO;
import kh.spring.dto.PayDTO;

@Service
public class StudentService {

	@Autowired
	private ChartDAO cdao;
	
	@Autowired
	private PayDAO pdao;
	
	// 설문조사 결과 저장
	public int researchInsert(ChartDTO dto) {
		return cdao.insert(dto);
	}
	
	// 베스트메뉴 셀렉트 옵션
	public List<MealDTO> bestOp(String b_month){
		return cdao.bestOp(b_month);
	}
	
	// 결제 정보 저장
	public int payInsert(PayDTO dto) {
		return pdao.insert(dto);
	}
	
}
