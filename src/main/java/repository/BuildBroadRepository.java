package repository;

import entity.AuctionEntity;
import entity.BuildBroadEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BuildBroadRepository extends CrudRepository<BuildBroadEntity, Integer>{
    List<BuildBroadEntity> findByAuctionEntity(AuctionEntity auction);
}
