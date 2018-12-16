package repository;

import entity.GoodsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsRepository extends CrudRepository<GoodsEntity, Integer>{
    GoodsEntity findByGoodNameAndDescriptionAndStatus(String goodName, String description, boolean status);
}
