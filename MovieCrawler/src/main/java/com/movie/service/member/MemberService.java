package com.movie.service.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.movie.domain.member.MemberDTO;

public interface MemberService {

	// 로그인
	public boolean login(MemberDTO mDto, HttpSession session);
	// 로그아웃
	public void logOut(HttpSession session);
	// 회원가입
	// 회원수정
	// 회원삭제
	// 회원정보 1건 검색
	public MemberDTO viewMember(String userid);
	// 비밀번호 수정
	// 현재비밀번호 체크
	public int idCheck(String id);
	public void write(MemberDTO mDto);
	// AJAX : 현재 PW 체크
	public int pwCheck(Map<String, Object> map);
	public void delete(String id, HttpSession session);
	public void update(MemberDTO mDto, HttpSession session);
}
