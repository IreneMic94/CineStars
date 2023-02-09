package it.generationitaly.cinestars.repository;

import java.util.List;

public interface CrudRepository<T, PK> {

	T findById(PK id);

	List<T> findAll();

	void save(T entity);

	void update(T entity);

	void delete(T entity);

	void deleteById(PK id);

}
