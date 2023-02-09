package it.generationitaly.cinestars.controller;

import java.io.IOException;

import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.repository.PellicolaRepository;
import it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/find-film-by-id")
public class FindFilmByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PellicolaRepository pellicolarepository = new PellicolaRepositoryImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Pellicola pellicola = pellicolarepository.findById(id);
		request.setAttribute("pellicola", pellicola);
		request.getRequestDispatcher("info-film.jsp").forward(request, response);;
	}

}
