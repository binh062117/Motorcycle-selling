package com.motorcycle.dao;

import com.motorcycle.model.BaseEntity;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public class InMemoryRepository<T extends BaseEntity> implements CrudRepository<T> {
    private final Map<Integer, T> store = new LinkedHashMap<Integer, T>();
    private final AtomicInteger sequence = new AtomicInteger(1);

    public synchronized List<T> findAll() {
        return new ArrayList<T>(store.values());
    }

    public synchronized Optional<T> findById(int id) {
        return Optional.ofNullable(store.get(id));
    }

    public synchronized T save(T entity) {
        if (entity.getId() <= 0) {
            entity.setId(sequence.getAndIncrement());
        } else if (entity.getId() >= sequence.get()) {
            sequence.set(entity.getId() + 1);
        }
        entity.touch();
        store.put(entity.getId(), entity);
        return entity;
    }

    public synchronized boolean delete(int id) {
        return store.remove(id) != null;
    }
}
