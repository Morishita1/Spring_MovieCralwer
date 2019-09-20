package com.movie.persistence.member;

import java.util.Map;

import com.movie.domain.member.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO mDto);
	public MemberDTO viewMember(String userid);
	public int idCheck(String id);
	public void write(MemberDTO mDto);
	public int pwCheck(Map<String, Object> map);
	public int delete(String id);
	public int update(MemberDTO mDto);
}
