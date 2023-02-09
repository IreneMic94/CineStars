package it.generationitaly.cinestars.repository;

import java.util.List;

import it.generationitaly.cinestars.entity.Artista;

public interface ArtistaRepository extends CrudRepository<Artista, Integer> {

	List<Artista> findByNome(String nome);

	List<Artista> findByFilm(int id);

	List<Artista> findByNomeLikeOrCognomeLike(String ricerca);
	
	int numeroArtisti(String ricerca);
}
