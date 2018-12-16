package repository;

import entity.AuctionEntity;
import entity.BidsEntity;
import entity.CustomerEntity;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BidsRepository extends CrudRepository<BidsEntity, Integer>{
    List<BidsEntity> findByAuctionEntity(AuctionEntity auction);

    @Query(value = "select sum(amount)\n"
            + "from (select b.auctionID, b.customerID, max(amount) as amount\n"
            + "	from bids b \n"
            + "		join auction a on b.auctionID = a.auctionID\n"
            + "		join customer c on b.customerID = c.customerID\n"
            + "	group by b.auctionID, b.customerID) as maxbid\n"
            + "		join auction a on maxbid.auctionID = a.auctionID\n"
            + "		join customer c on maxbid.customerID = c.customerID\n"
            + "where a.status = ?1 and c.customerID = ?2", nativeQuery = true)
    String sumAmountByCustomerOfBid(int status, int customerID);

    @Query(value = "select top 1 b.customerID\n"
            + "from bids b\n"
            + "where b.auctionID = ?1\n"
            + "order by bidID desc", nativeQuery = true)
    String findCustomerIDLastBid(int auctionID);
    List<BidsEntity> findByDate(Date date);
}
