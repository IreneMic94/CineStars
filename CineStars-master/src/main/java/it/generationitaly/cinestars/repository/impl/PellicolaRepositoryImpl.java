package it.generationitaly.cinestars.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import it.generationitaly.cinestars.entity.Pellicola;
import it.generationitaly.cinestars.repository.PellicolaRepository;

public class PellicolaRepositoryImpl extends CrudRepositoryImpl<Pellicola, Integer> implements PellicolaRepository {

	public PellicolaRepositoryImpl() {
		super(Pellicola.class);
	}

	@Override
	public List<Pellicola> findByNomeLike(String nome) {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			pellicole = em.createQuery("select p from Pellicola p where p.nome like :nome", Pellicola.class)
					.setParameter("nome", "%" + nome + "%").getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findByDate() {

		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery("from Pellicola ORDER BY anno DESC", Pellicola.class);
			q.setMaxResults(10);
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findByGenere(String genere) {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery("SELECT p FROM Pellicola p JOIN p.genere g WHERE g.nome=?1",
					Pellicola.class);
			q.setParameter(1, genere);
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findByAnno(int anno) {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery("SELECT p FROM Pellicola WHERE anno=?1 ", Pellicola.class);
			q.setParameter(1, anno);
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findByFirstTen() {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery("from Pellicola p", Pellicola.class);
			q.setMaxResults(10);
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findByArtista(int id) {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"select p FROM Pellicola p JOIN p.filmografia f JOIN f.artista a WHERE a.id= :id", Pellicola.class);
			q.setParameter("id", id);
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findAllSerie() {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery("FROM Pellicola p WHERE tipologia=:tipologia", Pellicola.class);
			q.setParameter("tipologia", "Serie Tv");
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public int numeroFilm(String ricerca) {
		int numeroFilm = 0;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"select p FROM Pellicola p WHERE tipologia=:tipologia and p.nome like :nome", Pellicola.class);
			q.setParameter("tipologia", "Film");
			q.setParameter("nome", "%" + ricerca + "%");
			numeroFilm = q.getResultList().size();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return numeroFilm;
	}

	@Override
	public int numeroSerie(String ricerca) {
		int numeroSerie = 0;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"select p FROM Pellicola p WHERE tipologia=:tipologia and p.nome like :nome", Pellicola.class);
			q.setParameter("tipologia", "Serie Tv");
			q.setParameter("nome", "%" + ricerca + "%");
			numeroSerie = q.getResultList().size();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return numeroSerie;
	}

	@Override
	public List<Pellicola> findFilmByNomeLike(String nome) {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"select p FROM Pellicola p WHERE tipologia=:tipologia and p.nome like :nome", Pellicola.class);
			q.setParameter("tipologia", "Film");
			q.setParameter("nome", "%" + nome + "%");
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findSerieByNomeLike(String nome) {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"select p FROM Pellicola p WHERE tipologia=:tipologia and p.nome like :nome", Pellicola.class);
			q.setParameter("tipologia", "Serie Tv");
			q.setParameter("nome", "%" + nome + "%");
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public List<Pellicola> findFilmByAnnoBetween(int a, int b, String nome) {
		List<Pellicola> pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"FROM Pellicola p WHERE anno between a=:a and b=:b and nome like :nome", Pellicola.class);
			q.setParameter("a", a);
			q.setParameter("b", b);
			q.setParameter("nome", "%" + nome + "%");
			pellicole = q.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public Pellicola findFirstPellicola() {
		Pellicola pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"select min(anno) FROM Pellicola p", Pellicola.class);
			pellicole = q.getSingleResult();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

	@Override
	public Pellicola findLastPellicola() {
		Pellicola pellicole = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Pellicola> q = em.createQuery(
					"select max(anno) FROM Pellicola p", Pellicola.class);
			pellicole = q.getSingleResult();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
		}
		return pellicole;
	}

}
