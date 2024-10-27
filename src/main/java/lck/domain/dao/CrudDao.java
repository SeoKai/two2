package lck.domain.dao;

import java.util.List;

public interface CrudDao<T> {
	List<T> selectAll() throws Exception;

	T selectById(int id) throws Exception;

	void insert(T entity) throws Exception;

	void update(T entity) throws Exception;

	void delete(int id) throws Exception;

}
