package it.generationitaly.cinestars.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import it.generationitaly.cinestars.entity.Recensione;
import it.generationitaly.cinestars.repository.RecensioneRepository;

public class RecensioneRepositoryImpl extends CrudRepositoryImpl<Recensione, Integer> implements RecensioneRepository {

	public RecensioneRepositoryImpl() {
		super(Recensione.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Recensione findByUtenteIdAndPellicolaId(int idUtente, int idPellicola) {
		Recensione recensione = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Recensione> q = em.createQuery(
					"select r FROM Recensione r JOIN r.utente u JOIN r.pellicola p where u.id= :idUtente and p.id= :idPellicola",
					Recensione.class);
			q.setParameter("idUtente", idUtente).setParameter("idPellicola", idPellicola);
			recensione = q.getSingleResult();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return recensione;
	}

	@Override
	public List<Recensione> findByPellicolaId(int idPellicola) {
		List<Recensione> recensioni = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Recensione> q = em.createQuery(
					"select r FROM Recensione r JOIN r.pellicola p WHERE p.id= :idPellicola",
					Recensione.class);
			q.setParameter("idPellicola", idPellicola);
			recensioni = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return recensioni;
	}

	@Override
	public List<Recensione> findByUtenteId(int id) {
		List<Recensione> recensioni = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Recensione> q = em.createQuery(
					"select r FROM Recensione r JOIN r.utente u WHERE u.id= :id",
					Recensione.class);
			q.setParameter("id", id);
			recensioni = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return recensioni;
	}

}
