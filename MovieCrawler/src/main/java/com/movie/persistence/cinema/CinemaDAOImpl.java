package com.movie.persistence.cinema;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.cinema.CinemaDTO;

@Repository
public class CinemaDAOImpl implements CinemaDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void movie(CinemaDTO cDto) {
		
		sqlSession.insert("cinema.movie",cDto);
	}

}
