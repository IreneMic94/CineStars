package it.generationitaly.cinestars.repository.impl;

import it.generationitaly.cinestars.entity.Filmografia;
import it.generationitaly.cinestars.repository.FilmografiaRepository;

public class FilmografiaRepositoryImpl extends CrudRepositoryImpl<Filmografia, Integer> implements FilmografiaRepository{

	public FilmografiaRepositoryImpl() {
		super(Filmografia.class);
	}
	
	
}
