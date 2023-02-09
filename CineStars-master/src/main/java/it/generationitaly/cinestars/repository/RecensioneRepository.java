package it.generationitaly.cinestars.repository;

import java.util.List;

import it.generationitaly.cinestars.entity.Recensione;

public interface RecensioneRepository extends CrudRepository<Recensione, Integer>{
	
	Recensione findByUtenteIdAndPellicolaId(int idUtente, int idPellicola);

	List<Recensione> findByPellicolaId(int idPellicola);
	
	List<Recensione> findByUtenteId(int id);
	
}
