package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinestars.entity.WatchList;
import it.generationitaly.cinestars.repository.WatchListRepository;
import it.generationitaly.cinestars.repository.impl.WatchListRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/filmutente")
public class FindPellicoleByUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private WatchListRepository watchListRepository = new WatchListRepositoryImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("utenteId");
		List<WatchList> watchlisti = watchListRepository.findByIdUtente(id);

		request.setAttribute("watchlisti", watchlisti);
		request.getRequestDispatcher("findPellicoleByUtenteId.jsp").forward(request, response);
		;
	}

}
