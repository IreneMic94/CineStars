package it.generationitaly.cinestars.repository;

import java.util.List;

import it.generationitaly.cinestars.entity.WatchList;

public interface WatchListRepository extends CrudRepository<WatchList, Integer> {

	List<WatchList> findByIdUtente(int id);


}
