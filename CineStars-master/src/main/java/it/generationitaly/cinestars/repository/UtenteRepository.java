package it.generationitaly.cinestars.repository;

import it.generationitaly.cinestars.entity.Utente;

public interface UtenteRepository extends CrudRepository<Utente, Integer> {

	Utente findByUsername(String username);

}
