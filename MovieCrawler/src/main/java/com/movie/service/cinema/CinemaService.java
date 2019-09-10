package com.movie.service.cinema;

import java.io.IOException;
import java.util.List;

import com.movie.domain.cinema.CinemaDTO;

public interface CinemaService {

	public List<CinemaDTO> movie() throws IOException;
}
