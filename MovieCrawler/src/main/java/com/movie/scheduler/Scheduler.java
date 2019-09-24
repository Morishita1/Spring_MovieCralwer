package com.movie.scheduler;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.movie.service.cinema.CinemaService;
import com.movie.service.movie.MovieService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class Scheduler {

	@Inject
	MovieService mService;
	
	@Inject
	CinemaService cSercice;
	
	// 영화정보 수집
	@Scheduled(cron = "0 0 12 * * *")
	public void movieCollect() throws IOException {
		
			mService.ticketRank();
//			cSercice.movie();
		
	}
	//영화평점 수집
	@Scheduled(cron = "0 50 12 * * *")
	public void replyCollect() throws IOException {
		mService.replyMovie();
	}
	
	
}
