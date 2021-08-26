package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int join(MemberDTO dto) {
		return mybatis.insert("Member.join", dto);
	}
	public MemberDTO login(Map<String, String> param) {
		return mybatis.selectOne("Member.login",param);
	}
	public int idCheck(String memberId) {
		return mybatis.selectOne("Member.idCheck",memberId);
	}
	public int modiName(MemberDTO dto) {
		return mybatis.update("Member.modiName", dto);
	}
	public int modiSchool(MemberDTO dto) {
		return mybatis.update("Member.modiSchool", dto);
	}
	public int modiPhone(MemberDTO dto) {
		return mybatis.update("Member.modiPhone", dto);
	}
	public int modiAge(MemberDTO dto) {
		return mybatis.update("Member.modiAge", dto);
	}
	public int modiPw(MemberDTO dto) {
		return mybatis.update("Member.modiPw", dto);
	}
	public int pwck(Map<String, String> map) {
		return mybatis.selectOne("Member.pwck",map);
	}
	public int updateProfile(MemberDTO dto) {
		return mybatis.update("Member.updateProfile",dto);
	}
	public int findIdProc(Map<String, String> map) {
		return mybatis.selectOne("Member.findIdProc",map);
	}
	public List<MemberDTO> findIdMemebr(Map<String, String> map) {
		return mybatis.selectList("Member.findIdMemebr",map);
	}
	public int findPwProc(Map<String, String> map) {
		return mybatis.selectOne("Member.findPwProc",map);
	}
	public int newPwProc(Map<String, String> map) {
		return mybatis.update("Member.newPwProc", map);
	}
	public int profileBasic(Map<String, String> map) {
		return mybatis.update("Member.profileBasic", map);
	}
	public MemberDTO memberInfo(String email) {
		return mybatis.selectOne("Member.memberInfo",email);
	}
	public int delMem(String email) {
		return mybatis.delete("Member.delMem", email);
	}
	/*
	 * public int profileBasic(Map<String, String> map) { return
	 * mybatis.update("Member.profileBasic", map); }
	 */}
