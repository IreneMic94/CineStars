package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinestars.entity.Genere;
import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.repository.GenereRepository;
import it.generationitaly.cinestars.repository.PellicolaRepository;
import it.generationitaly.cinestars.repository.impl.GenereRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl();
    private GenereRepository genereRepository = new GenereRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		List<Pellicola> pellicole = pellicolaRepository.findAll();
		List<Pellicola> pellicole2 = pellicolaRepository.findByFirstTen();
		List<Pellicola> pellicole3 = pellicolaRepository.findByDate();
		List<Pellicola> pellicole4 = pellicolaRepository.findAllSerie();
		
		List<Genere> generi = genereRepository.findAll();
		request.setAttribute("pellicole", pellicole);
		request.setAttribute("pellicole2", pellicole2);
		request.setAttribute("pellicole3", pellicole3);
		request.setAttribute("pellicole4", pellicole4);
		request.getSession().setAttribute("generi", generi); //per conservare
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	

}
