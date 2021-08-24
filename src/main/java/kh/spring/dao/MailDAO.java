package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.St_MailDTO;

@Repository
public class MailDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<String> mailList(String nu_email){
		return mybatis.selectList("Mail.mailList",nu_email);
	}
	
	public int addStudent(St_MailDTO dto) {
		return mybatis.insert("Mail.addStudent",dto);
	}
	
	public List<St_MailDTO> studentList(String nu_email){
		return mybatis.selectList("Mail.studentList",nu_email);
	}
	
	public int excelupload(Map<String, Object> map) {
		return mybatis.insert("Mail.excelupload", map);
	}
	
	public int deleteStudentProc(int seq) {
		return mybatis.delete("Mail.deleteStudentProc", seq);
	}
	
	public int updateStudentProc(St_MailDTO dto) {
		return mybatis.delete("Mail.update", dto);
	}
}
