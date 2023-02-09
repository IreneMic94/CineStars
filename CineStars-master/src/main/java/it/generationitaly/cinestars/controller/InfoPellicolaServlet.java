package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinestars.entity.Artista;
import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.entity.Recensione;
import it.generationitaly.cinestars.entity.WatchList;
import it.generationitaly.cinestars.repository.ArtistaRepository;
import it.generationitaly.cinestars.repository.PellicolaRepository;
import it.generationitaly.cinestars.repository.RecensioneRepository;
import it.generationitaly.cinestars.repository.WatchListRepository;
import it.generationitaly.cinestars.repository.impl.ArtistaRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.WatchListRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/info-pellicola")
public class InfoPellicolaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl();
	private ArtistaRepository artistiRepository = new ArtistaRepositoryImpl();
	private RecensioneRepository recensioneRepository = new RecensioneRepositoryImpl();
	private WatchListRepository watchlistRepository = new WatchListRepositoryImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		Pellicola pellicola = pellicolaRepository.findById(id);
		List<Artista> artisti = artistiRepository.findByFilm(id);
		List<Recensione> recensioni = recensioneRepository.findByPellicolaId(id);

		if (request.getSession().getAttribute("utenteId") != null) {
			int idUtente = (int) request.getSession().getAttribute("utenteId");
			List<WatchList> watchlisti = watchlistRepository.findByIdUtente(idUtente);
			Recensione recensione = recensioneRepository.findByUtenteIdAndPellicolaId(idUtente, id);
			request.setAttribute("watchlisti", watchlisti);
			request.setAttribute("recensione", recensione);
		}
		
		request.setAttribute("pellicola", pellicola);
		request.setAttribute("artisti", artisti);
		request.setAttribute("recensioni", recensioni);
		request.getRequestDispatcher("info-film.jsp").forward(request, response);
	}
}
