package entity;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "bids")
public class BidsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bidID;
    @Temporal(TemporalType.DATE)
    private Date date;
    private double amount;
    //n - 1 to Customer
    @ManyToOne()
    @JoinColumn(name = "customerID")
    private CustomerEntity customerEntity;
    //n - 1 to Auction
    @ManyToOne()
    @JoinColumn(name = "auctionID")
    private AuctionEntity auctionEntity;
    
    //construtor
    public BidsEntity(){}

    public BidsEntity(int bidID, Date date, double amount, CustomerEntity customerEntity, AuctionEntity auctionEntity) {
        this.bidID = bidID;
        this.date = date;
        this.amount = amount;
        this.customerEntity = customerEntity;
        this.auctionEntity = auctionEntity;
    }
    
    //get - set

    public int getBidID() {
        return bidID;
    }

    public void setBidID(int bidID) {
        this.bidID = bidID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public CustomerEntity getCustomerEntity() {
        return customerEntity;
    }

    public void setCustomerEntity(CustomerEntity customerEntity) {
        this.customerEntity = customerEntity;
    }

    public AuctionEntity getAuctionEntity() {
        return auctionEntity;
    }

    public void setAuctionEntity(AuctionEntity auctionEntity) {
        this.auctionEntity = auctionEntity;
    }
    
}
