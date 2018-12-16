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
@Table(name = "buildbroad")
public class BuildBroadEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int broadID;
    private String message;
    @Temporal(TemporalType.DATE)
    private Date date;
    //n - 1 to customer
    @ManyToOne()
    @JoinColumn(name = "customerID")
    private CustomerEntity customerEntity;
    //n - 1 to Auction
    @ManyToOne()
    @JoinColumn(name = "auctionID")
    private AuctionEntity auctionEntity;
    
    //construtor
    public BuildBroadEntity(){}

    public BuildBroadEntity(int broadID, String message, Date date, CustomerEntity customerEntity, AuctionEntity auctionEntity) {
        this.broadID = broadID;
        this.message = message;
        this.date = date;
        this.customerEntity = customerEntity;
        this.auctionEntity = auctionEntity;
    }
    
    //get - set

    public int getBroadID() {
        return broadID;
    }

    public void setBroadID(int broadID) {
        this.broadID = broadID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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
