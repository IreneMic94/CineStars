package it.generationitaly.cinestars.controller;

import java.io.IOException;

import it.generationitaly.cinestars.entity.Utente;
import it.generationitaly.cinestars.repository.UtenteRepository;
import it.generationitaly.cinestars.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/find-utente-id")
public class FindUtenteById extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Utente utente = utenteRepository.findById(id);
		request.setAttribute("utente", utente);
		request.getRequestDispatcher("profilo.jsp");
	}

}
