package it.generationitaly.cinestars.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import it.generationitaly.cinestars.entity.Artista;
import it.generationitaly.cinestars.repository.ArtistaRepository;

public class ArtistaRepositoryImpl extends CrudRepositoryImpl<Artista, Integer> implements ArtistaRepository {

	public ArtistaRepositoryImpl() {
		super(Artista.class);
	}

	@Override
	public List<Artista> findByNome(String nome) {

		List<Artista> artisti = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Artista> q = em.createQuery("select a FROM Artista a where nome= :nome", Artista.class);
			q.setParameter("nome", nome);
			artisti = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return artisti;
	}

	@Override
	public List<Artista> findByFilm(int id) {
		List<Artista> artisti = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Artista> q = em
					.createQuery("select a FROM Artista a JOIN a.filmografia f JOIN f.pellicola p WHERE p.id= :id", Artista.class);
			q.setParameter("id", id);
			artisti = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return artisti;
	}

	@Override
	public List<Artista> findByNomeLikeOrCognomeLike(String ricerca) {
		List<Artista> artisti = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Artista> q = em.createQuery(
					"select a FROM Artista a where a.nome like :nome or a.cognome like :cognome", Artista.class);
			q.setParameter("nome", "%" + ricerca + "%");
			q.setParameter("cognome", "%" + ricerca + "%");
			artisti = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return artisti;
	}

	@Override
	public int numeroArtisti(String ricerca) {
		int numeroArtisti = 0;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Artista> q = em.createQuery(
					"select a FROM Artista a where a.nome like :nome or a.cognome like :cognome", Artista.class);
			q.setParameter("nome", "%" + ricerca + "%");
			q.setParameter("cognome", "%" + ricerca + "%");
			numeroArtisti = q.getResultList().size();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return numeroArtisti;
	}

}
