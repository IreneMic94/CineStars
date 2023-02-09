package it.generationitaly.cinestars.controller;

import java.io.IOException;
import java.util.Date;

import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.entity.Recensione;
import it.generationitaly.cinestars.entity.Utente;
import it.generationitaly.cinestars.repository.PellicolaRepository;
import it.generationitaly.cinestars.repository.RecensioneRepository;
import it.generationitaly.cinestars.repository.UtenteRepository;
import it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinestars.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-recensione")
public class AddRecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PellicolaRepository pellicolaRepository = new PellicolaRepositoryImpl();
	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	private RecensioneRepository recensioneRepository = new RecensioneRepositoryImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idUtente = (int) request.getSession().getAttribute("utenteId");
		int idPellicola = Integer.parseInt(request.getParameter("idPellicola"));
		String idRecensioneAsString = request.getParameter("idRecensione");
		String descrizione = request.getParameter("descrizione");
		int voto = Integer.parseInt(request.getParameter("voto"));
		Utente utente = utenteRepository.findById(idUtente);
		Pellicola pellicola = pellicolaRepository.findById(idPellicola);

		if (idRecensioneAsString != null) {
			int idRecensione = Integer.parseInt(idRecensioneAsString);
			Recensione recensione = recensioneRepository.findById(idRecensione);
			recensione.setDescrizione(descrizione);
			recensione.setVoto(voto);
			recensione.setUtente(utente);
			recensione.setPellicola(pellicola);
			recensione.setDataRecensione(new Date());
			recensioneRepository.update(recensione);
		} else {
			Recensione recensione = new Recensione();
			recensione.setDescrizione(descrizione);
			recensione.setVoto(voto);
			recensione.setUtente(utente);
			recensione.setPellicola(pellicola);
			recensione.setDataRecensione(new Date());
			recensioneRepository.save(recensione);
		}
		
		response.sendRedirect("info-pellicola?id=" + idPellicola);
	}

}
