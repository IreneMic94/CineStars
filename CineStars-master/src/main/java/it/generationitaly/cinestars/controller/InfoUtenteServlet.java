package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinestars.entity.Recensione;
import it.generationitaly.cinestars.entity.Utente;
import it.generationitaly.cinestars.entity.WatchList;
import it.generationitaly.cinestars.repository.RecensioneRepository;
import it.generationitaly.cinestars.repository.UtenteRepository;
import it.generationitaly.cinestars.repository.WatchListRepository;
import it.generationitaly.cinestars.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.UtenteRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.WatchListRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InfoUtenteServlet
 */
@WebServlet("/info-profili")
public class InfoUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	private WatchListRepository watchListRepository = new WatchListRepositoryImpl();
	private RecensioneRepository recensioneRepository = new RecensioneRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Utente utente = utenteRepository.findById(id);
		List<WatchList> watchlisti = watchListRepository.findByIdUtente(id);
		List<Recensione> recensioni = recensioneRepository.findByUtenteId(id);
		request.setAttribute("recensioni", recensioni);
		request.setAttribute("watchlisti", watchlisti);
		request.setAttribute("utente", utente);
		request.getRequestDispatcher("info-profili.jsp").forward(request, response);
	}

}
