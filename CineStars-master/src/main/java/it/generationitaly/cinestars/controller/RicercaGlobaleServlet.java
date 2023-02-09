package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import it.generationitaly.cinestars.entity.Artista;
import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.repository.ArtistaRepository;
import it.generationitaly.cinestars.repository.PellicolaRepository;
import it.generationitaly.cinestars.repository.impl.ArtistaRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ricerca-globale")
public class RicercaGlobaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ArtistaRepository artistaRepository = new ArtistaRepositoryImpl();
	private PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Pellicola> filmByAnno = null;
		List<Pellicola> serieTv = null;
		List<Pellicola> pellicole = null;
		List<Artista> artisti = null;
		String nomeRicerca = request.getParameter("nomeRicerca");
		String filtro = request.getParameter("filtro");
		String anno1AsString = request.getParameter("anno1");
		String anno2AsString = request.getParameter("anno2");
		int anno1, anno2;
		
		if(filtro!=null && anno1AsString!=null && anno2AsString!=null && filtro.equals("film")) {
			anno1 = Integer.parseInt(anno1AsString);
			anno2 = Integer.parseInt(anno2AsString);
			filmByAnno = pellicolaRepository.findFilmByAnnoBetween(anno1, anno2, " ");
		}
		
		if(filtro==null || filtro.equals("film"))  {
			pellicole = pellicolaRepository.findFilmByNomeLike(nomeRicerca);
		} 
		
		
		if(filtro!=null && filtro.equals("serieTv")) {
			pellicole = pellicolaRepository.findSerieByNomeLike(nomeRicerca);
		}
		
		
		if( filtro!=null && filtro.equals("persone")) {
		    artisti = artistaRepository.findByNomeLikeOrCognomeLike(nomeRicerca);
		} 
		
		int numeroArtisti = artistaRepository.numeroArtisti(nomeRicerca);
		int numeroFilm = pellicolaRepository.numeroFilm(nomeRicerca);
		int numeroSerie = pellicolaRepository.numeroSerie(nomeRicerca);
		
		request.setAttribute("artisti", artisti);
		request.setAttribute("pellicole", pellicole);
		request.setAttribute("nomeRicerca", nomeRicerca);
		request.setAttribute("filtro", filtro);
		request.setAttribute("numeroArtisti", numeroArtisti);
		request.setAttribute("numeroFilm", numeroFilm);
		request.setAttribute("numeroSerie", numeroSerie);
		request.setAttribute("filmByAnno", filmByAnno);
		request.getRequestDispatcher("ricerca-globale.jsp").forward(request, response);

	}

}
