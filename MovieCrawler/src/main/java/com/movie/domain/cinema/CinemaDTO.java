package com.movie.domain.cinema;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CinemaDTO {

	private int ciseq;
	private String title;
	private int score;
	private String text;
	private String writer;
	private String opdate;
	
}
