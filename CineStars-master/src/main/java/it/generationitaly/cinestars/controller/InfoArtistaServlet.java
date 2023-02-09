package it.generationitaly.cinestars.controller;

import java.io.IOException;
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

/**
 * Servlet implementation class InfoArtistaServlet
 */
@WebServlet("/info-artista")
public class InfoArtistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private ArtistaRepository artistaRepository = new ArtistaRepositoryImpl();
    private PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Artista artista = artistaRepository.findById(id);
		List<Pellicola> pellicole = pellicolaRepository.findByArtista(id);
		request.setAttribute("artista", artista);
		request.setAttribute("pellicole", pellicole);
		request.getRequestDispatcher("info-artista.jsp").forward(request, response);
	}

}
