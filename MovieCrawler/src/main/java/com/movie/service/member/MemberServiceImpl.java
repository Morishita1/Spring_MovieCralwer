package com.movie.service.member;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.movie.domain.member.MemberDTO;
import com.movie.persistence.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO mDao;
	
	@Override
	public boolean login(MemberDTO mDto, HttpSession session) {
		boolean result =mDao.loginCheck(mDto); // true or false
		if(result) {
			// 로그인 성공 -> session 값을 담음
			MemberDTO one= viewMember(mDto.getUserid());
			session.setAttribute("userid", one.getUserid());
			session.setAttribute("name", one.getName());
		}
		return result;
	}

	@Override
	public void logOut(HttpSession session) {
		// 로그아웃, 세션을 초기화
		session.invalidate();
		
	}

	@Override
	public MemberDTO viewMember(String userid) {

		return mDao.viewMember(userid);
	}

	@Override
	public int idCheck(String id) {
		
		return mDao.idCheck(id);
	}

	@Override
	public void write(MemberDTO mDto) {
		mDao.write(mDto);
		
	}

	@Override
	public int pwCheck(Map<String, Object> map) {
		return mDao.pwCheck(map);
	}

	@Override
	public void delete(String id, HttpSession session) {
		int result = mDao.delete(id);
		
		if(result >=1) {
			session.invalidate();
		}
		
	}

	@Override
	public void update(MemberDTO mDto, HttpSession session) {
		// 1. 수정
		String userid=(String)session.getAttribute("userid");
		mDto.setUserid(userid);
		int result = mDao.update(mDto);
		// 2. session 최신값으로 변경
		if(result > 0 ) {
			session.setAttribute("name", mDto.getName());
		}
		
	}

	
	

}
