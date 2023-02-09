package it.generationitaly.cinestars.repository.impl;

import it.generationitaly.cinestars.entity.Genere;
import it.generationitaly.cinestars.repository.GenereRepository;

public class GenereRepositoryImpl extends CrudRepositoryImpl<Genere, Integer> implements GenereRepository {

	public GenereRepositoryImpl() {
		super(Genere.class);
		// TODO Auto-generated constructor stub
	}

}
