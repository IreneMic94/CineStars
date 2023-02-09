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

/**
 * Servlet implementation class UpdateUtenteServlet
 */
@WebServlet("/update-utente")
public class UpdateUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String nazionalita = request.getParameter("nazionalita");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Utente utente = utenteRepository.findById(id); // ci serve il vecchio proprietario
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setNazionalita(nazionalita);
		utente.setUsername(username);
		utente.setPassword(password);
//		Utente utenteUsername = utenteRepository.findByUsername(username);
//		if(username.equals(utenteUsername.getUsername())) {
//			request.setAttribute("usernameExist", "Username già esistente");
//			request.getRequestDispatcher("form-update-utente.jsp").forward(request, response);
//			return;
//		}
		utenteRepository.update(utente);
		response.sendRedirect("profiloutente");
//		response.sendRedirect(request.getContextPath());
	}

}
