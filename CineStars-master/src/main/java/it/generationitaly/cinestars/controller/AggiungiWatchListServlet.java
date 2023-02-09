package it.generationitaly.cinestars.controller;

import java.io.IOException;


import it.generationitaly.cinestars.entity.WatchList;
import it.generationitaly.cinestars.repository.PellicolaRepository;
import it.generationitaly.cinestars.repository.UtenteRepository;
import it.generationitaly.cinestars.repository.WatchListRepository;
import it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.UtenteRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.WatchListRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-watchlist")
public class AggiungiWatchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WatchListRepository watchListRepository = new WatchListRepositoryImpl();
	private PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl();
	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idPellicola = Integer.parseInt(request.getParameter("idPellicola"));
		int idUtente = (int) request.getSession().getAttribute("utenteId");
		WatchList watchlist = new WatchList();
		watchlist.setPellicola(pellicolaRepository.findById(idPellicola));
		watchlist.setUtente(utenteRepository.findById(idUtente));
		watchListRepository.save(watchlist);
		response.sendRedirect("info-pellicola?id=" + idPellicola);
	}

}
