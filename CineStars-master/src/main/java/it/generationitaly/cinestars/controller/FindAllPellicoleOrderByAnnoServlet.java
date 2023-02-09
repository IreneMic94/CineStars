package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.repository.PellicolaRepository;
import it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/film-all-film-by-anno")
public class FindAllPellicoleOrderByAnnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl(); 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Pellicola> pellicole = pellicolaRepository.findByDate();
		request.setAttribute("#", pellicole);
		request.getRequestDispatcher("#").forward(request, response);
	}

}
