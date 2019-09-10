package com.movie.service.cinema;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.movie.domain.cinema.CinemaDTO;
import com.movie.persistence.cinema.CinemaDAO;

@Service
public class CinemaServiceImpl implements CinemaService {

	@Inject
	CinemaDAO cDao;

	int page = 1;
	String url = "";
	String compare = "";
	int ciseq = 1;
	int count=1;

	@Override
	public List<CinemaDTO> movie() throws IOException {

		String naverlove = "https://movie.naver.com/movie/bi/mi/basic.nhn?code=179158";
		String naverre = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=179158&type=after&onlyActualPointYn=N&order=sympathyScore&page=";

		while (count < 10) {
			url = naverre + page;

			Document naverDoc = Jsoup.connect(naverlove).get();
			Elements navertitle = naverDoc.select("h3.h_movie > a");
			String title = navertitle.get(0).text();
			Document naverDocre = Jsoup.connect(url).get();
			Elements rep = naverDocre.select("div.score_result li");

			for (int i = 0; i < rep.size(); i++) {

				Elements naverSc = rep.get(i).select("div > em");
				String scorena = naverSc.get(0).text();
				int score = Integer.parseInt(scorena);
				Elements naverco = rep.get(i).select("div.score_reple > p");
				String text = naverco.get(0).text();
				Elements naverwr = rep.get(i).select("div.score_reple > dl > dt > em");
				String naverwriter = naverwr.get(0).text();
				String writer = naverwriter.substring(0, naverwriter.indexOf("*")) + ")";
				String naverdate = naverwr.get(1).text();
				String opdate = naverdate.substring(0, 10);
				
				
				CinemaDTO cDto = new CinemaDTO(ciseq, title, score, text, writer, opdate);
				cDao.movie(cDto);
				ciseq++;
			}
			page = page + 1;
			count++;

		}

		return null;
	}
}
