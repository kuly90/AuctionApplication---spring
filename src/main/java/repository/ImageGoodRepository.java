package repository;

import entity.ImageGoodEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageGoodRepository extends CrudRepository<ImageGoodEntity, Integer>{
    
}
