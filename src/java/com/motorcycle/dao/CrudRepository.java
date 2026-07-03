package com.motorcycle.dao;

import com.motorcycle.model.BaseEntity;
import java.util.List;
import java.util.Optional;

public interface CrudRepository<T extends BaseEntity> {
    List<T> findAll();
    Optional<T> findById(int id);
    T save(T entity);
    boolean delete(int id);
}
