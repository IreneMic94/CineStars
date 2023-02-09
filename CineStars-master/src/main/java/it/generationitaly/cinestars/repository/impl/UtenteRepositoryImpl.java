package it.generationitaly.cinestars.repository.impl;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import it.generationitaly.cinestars.entity.Utente;
import it.generationitaly.cinestars.repository.UtenteRepository;

public class UtenteRepositoryImpl extends CrudRepositoryImpl<Utente, Integer> implements UtenteRepository{

	public UtenteRepositoryImpl() {
		super(Utente.class);
	}

	@Override
	public Utente findByUsername(String username) {
		Utente utente = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {	
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			utente = em.createQuery("from Utente u where u.username =?1",Utente.class).setParameter(1, username).getSingleResult();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if(tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if(em != null)
				em.close();
		}
		return utente;
	}

}