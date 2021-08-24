package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MailDAO;
import kh.spring.dto.St_MailDTO;

@Service
public class MailService {
	
	@Autowired
	private MailDAO dao;
	
	public List<St_MailDTO> studentList(String nu_email){ // 메인갈때 리스트 물어오기
		return dao.studentList(nu_email);
	}
	
	public int addStudent(St_MailDTO dto) {
		System.out.println(dto.getStu_name() +":" + dto.getStu_email() + ":"+ dto.getSchool() + ":"+ dto.getNu_email());
		return dao.addStudent(dto);
	}
	
	public List<String> mailList(String nu_email){ // 메일보낼때, 학생 메일 가지고 오는거
		return dao.mailList(nu_email);
	}
	
	public int deleteStudentProc(int seq) {
		return dao.deleteStudentProc(seq);
	}
	
	public int updateStudentProc(St_MailDTO dto) {
		return dao.updateStudentProc(dto);
	}
}
