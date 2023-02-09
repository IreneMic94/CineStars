package it.generationitaly.cinestars.controller;

import java.io.IOException;

import it.generationitaly.cinestars.repository.UtenteRepository;
import it.generationitaly.cinestars.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteUtenteServlet
 */
@WebServlet("/delete-utente")
public class DeleteUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		utenteRepository.deleteById(id);
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath());
	}

}
