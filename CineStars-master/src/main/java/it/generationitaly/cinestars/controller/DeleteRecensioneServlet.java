package it.generationitaly.cinestars.controller;

import java.io.IOException;

import it.generationitaly.cinestars.repository.RecensioneRepository;
import it.generationitaly.cinestars.repository.impl.RecensioneRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteRecensioneServlet
 */
@WebServlet("/delete-recensione")
public class DeleteRecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RecensioneRepository recensioneRepository = new RecensioneRepositoryImpl();
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idRecensione"));
		recensioneRepository.deleteById(id);
		response.sendRedirect("profiloutente");
	}

}
