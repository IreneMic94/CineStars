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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean hasErrors = false;

		Utente utente = utenteRepository.findByUsername(username);
		if (utente == null) {
			request.setAttribute("error-username", "Non esiste alcun utente con questo nome");
			hasErrors = true;
		} else if (utente != null && !utente.getPassword().equals(password)) {
			request.setAttribute("error-password", "La password non è corretta");
			hasErrors = true;
		}
		if (hasErrors) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("utenteId", utente.getId());
		session.setAttribute("utenteUsername", utente.getUsername());
		String referer = (String) request.getSession().getAttribute("referer");
//		System.out.println(referer);
		if (referer != null && !referer.equals("http://localhost:8080/cinestars/form-registra-utente.jsp")) {
			response.sendRedirect(referer);
		} else if(referer != null && referer.equals("http://localhost:8080/cinestars/form-registra-utente.jsp")) {
			response.sendRedirect(request.getContextPath());
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}
}
