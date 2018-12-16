package repository;

import entity.AuctionEntity;
import entity.CustomerEntity;
import java.sql.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuctionRepository extends CrudRepository<AuctionEntity, Integer> {

    List<AuctionEntity> findByStatus(int status);
    
    @Query(value = "select a.auctionID, g.goodName, c.customerID, maxbidbyCustomer.amount, a.startDate, a.hourStart, a.minuteStart, maxbid.maxAmount, a.status\n"
            + "from (select b.auctionID, b.customerID, max(amount) as amount\n"
            + "		from bids b\n"
            + "		join auction a on b.auctionID = a.auctionID\n"
            + "				 join customer c on b.customerID = c.customerID\n"
            + "		group by b.auctionID, b.customerID) as maxbidbyCustomer\n"
            + "		join auction a on maxbidbyCustomer.auctionID = a.auctionID\n"
            + "		join goods g on a.goodID = g.goodID\n"
            + "		join customer c on maxbidbyCustomer.customerID = c.customerID\n"
            + "		join (select b.auctionID, max(amount) as maxAmount\n"
            + "			from bids b\n"
            + "					join auction a on b.auctionID = a.auctionID\n"
            + "			group by b.auctionID) as maxbid on a.auctionID = maxbid.auctionID\n"
            + "where c.customerID = ?1", nativeQuery = true)
    List<String> getListAuctionDebit(int customerID);

    @Query(value = "select * \n"
            + "from auction a\n"
            + "		join customer c on a.customerID = c.customerID\n"
            + "		join goods g on a.goodID = g.goodID\n"
            + "where a.status = ?1\n"
            + "order by a.auctionID desc\n"
            + "OFFSET ?2 ROWS FETCH FIRST ?3 ROWS ONLY", nativeQuery = true)
    List<AuctionEntity> listAuctionByStatus(int status, int firstResult, int maxResult);

    @Query(value = "select * \n"
            + "from auction\n"
            + "where auctionID in (select a.auctionID\n"
            + "				from auction a join goods g on a.goodID = g.goodID\n"
            + "				where g.goodName like %?1%) and status = ?2", nativeQuery = true)
    List<AuctionEntity> listSearchNotPrice(String goodName, int status);

    List<AuctionEntity> findByStartDateBetween(Date fromDate, Date toDate);

    

    AuctionEntity findByAuctionID(int id);

    List<AuctionEntity> findByCustomerEntity(CustomerEntity customer);
    
    @Query(value = "select * \n"
            + "from auction\n"
            + "where auctionID in (select a.auctionID\n"
            + "				from auction a join goods g on a.goodID = g.goodID\n"
            + "				where g.goodName like %?1%)", nativeQuery = true)
    List<AuctionEntity> listSearch(String search);
}
