package it.generationitaly.cinestars.repository;

import java.util.List;

import it.generationitaly.cinestars.entity.Pellicola;

public interface PellicolaRepository extends CrudRepository<Pellicola, Integer> {

	List<Pellicola> findByNomeLike(String nome);
	
	List<Pellicola> findFilmByNomeLike(String nome);
	
	List<Pellicola> findSerieByNomeLike(String nome);

	List<Pellicola> findByDate();

	List<Pellicola> findByGenere(String genere);

	List<Pellicola> findByAnno(int anno);

	List<Pellicola> findByFirstTen();

	List<Pellicola> findByArtista(int id);
	
	List<Pellicola> findAllSerie();
	
	List<Pellicola> findFilmByAnnoBetween(int a, int b, String nome);
	
	Pellicola findFirstPellicola();
	
	Pellicola findLastPellicola();
	
	int numeroFilm(String ricerca);
	
	int numeroSerie(String ricerca);
}
