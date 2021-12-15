package com.icia.memberboard.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.memberboard.dto.MemberDTO;

@Repository
public class MemberRepository {
	
	@Autowired
	private SqlSessionTemplate sql;

	public int m_save(MemberDTO member) {
		return sql.insert("Member.m_save", member);
	}
	
	public MemberDTO m_mypage(long m_number) {
		return sql.selectOne("Member.m_mypage", m_number);
	}

	public MemberDTO m_login(MemberDTO member) {
		return sql.selectOne("Member.m_login", member);
	}

	public List<MemberDTO> m_findAll() {
		return sql.selectList("Member.m_findAll");
	}

	public MemberDTO m_findById(long m_number) {
		return sql.selectOne("Member.m_findById", m_number);
	}


	public void m_delete(long m_number) {
		sql.delete("Member.m_delete", m_number);
		
	}

	public void m_update(MemberDTO member) {
		sql.update("Member.m_update", member);
		
	}

	public String idDuplicate(String m_id) {
		return sql.selectOne("Member.idDuplicate", m_id);

	}

}
