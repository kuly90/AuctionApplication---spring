package repository;

import entity.ComissionEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComissionRepository extends CrudRepository<ComissionEntity, Integer>{
    ComissionEntity findByMinimumLessThanAndMaximumGreaterThanAndStatus(double price1, double price2, boolean status);
}
