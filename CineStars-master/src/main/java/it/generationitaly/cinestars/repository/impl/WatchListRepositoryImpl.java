package it.generationitaly.cinestars.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import it.generationitaly.cinestars.entity.WatchList;
import it.generationitaly.cinestars.repository.WatchListRepository;

public class WatchListRepositoryImpl extends CrudRepositoryImpl<WatchList, Integer> implements WatchListRepository {

	public WatchListRepositoryImpl() {
		super(WatchList.class);
	}

	@Override
	public List<WatchList> findByIdUtente(int id) {
		List<WatchList> watchlisti = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<WatchList> q = em.createQuery("select w from WatchList w where w.utente.id=:id ORDER BY w.id",
					WatchList.class);
			q.setParameter("id", id);
			watchlisti = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return watchlisti;
	}

}
