package it.generationitaly.cinestars.repository;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PersistenceUtil {

	private static EntityManagerFactory emf;

	static {
		emf = Persistence.createEntityManagerFactory("persistence");
	}

	public static EntityManagerFactory getEntityManagerFactory() {
		return emf;
	}

}
