package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.entity.Utente;
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

/**
 * Servlet implementation class DeleteWatchlistServlet
 */
@WebServlet("/delete-watchlist")
public class DeleteWatchlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private WatchListRepository watchListRepository = new WatchListRepositoryImpl();
	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	private PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("utenteId"));
        Utente utente=utenteRepository.findById(id);
        id = Integer.parseInt(request.getParameter("idPellicola"));
        Pellicola pellicola = pellicolaRepository.findById(id);
        List<WatchList> watchlisti=utente.getWatchlist();
        for (WatchList watchlist : watchlisti) {
        	if(watchlist.getPellicola().getId()==pellicola.getId()) {
        		watchListRepository.delete(watchlist);
        		break;
        	}
        }
//		response.sendRedirect("profiloutente");
		String referer = request.getHeader("referer");
        response.sendRedirect(referer);	
	}

}
