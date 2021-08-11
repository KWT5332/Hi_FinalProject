package kh.spring.dao;

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
	
}
