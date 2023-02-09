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


@WebServlet("/registra-utente")
public class RegistraUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String nazionalita = request.getParameter("nazionalita");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Utente utente = new Utente();
		
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setNazionalita(nazionalita);
		utente.setUsername(username);
		utente.setPassword(password);
		Utente utenteUsername = utenteRepository.findByUsername(username);
		if(utenteUsername == null) {
			utenteRepository.save(utente);
			response.sendRedirect(request.getContextPath());
			
		} else if(utenteUsername != null) {
			request.setAttribute("usernameExist", "Username già esistente");
			request.getRequestDispatcher("form-registra-utente.jsp").forward(request, response);
			return;
		}
	}

}
