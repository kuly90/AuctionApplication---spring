package entity;

import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "comission")
public class ComissionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int comissionID;
    private double minimum;
    private double maximum;
    private double amountOld;
    private double amountNew;
    @Temporal(TemporalType.DATE)
    private Date dateChange;
    private boolean status;
    //1 - n to auction
    @OneToMany(mappedBy = "comissionEntity", fetch = FetchType.EAGER)
    List<AuctionEntity> auctionEntitys;
    
    //construtor
    public ComissionEntity(){}

    public ComissionEntity(int comissionID, double minimum, double maximum, double amountOld, double amountNew, Date dateChange, boolean status, List<AuctionEntity> auctionEntitys) {
        this.comissionID = comissionID;
        this.minimum = minimum;
        this.maximum = maximum;
        this.amountOld = amountOld;
        this.amountNew = amountNew;
        this.dateChange = dateChange;
        this.status = status;
        this.auctionEntitys = auctionEntitys;
    }

    //get - set

    public int getComissionID() {
        return comissionID;
    }

    public void setComissionID(int comissionID) {
        this.comissionID = comissionID;
    }

    public double getMinimum() {
        return minimum;
    }

    public void setMinimum(double minimum) {
        this.minimum = minimum;
    }

    public double getMaximum() {
        return maximum;
    }

    public void setMaximum(double maximum) {
        this.maximum = maximum;
    }

    public double getAmountOld() {
        return amountOld;
    }

    public void setAmountOld(double amountOld) {
        this.amountOld = amountOld;
    }

    public double getAmountNew() {
        return amountNew;
    }

    public void setAmountNew(double amountNew) {
        this.amountNew = amountNew;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getDateChange() {
        return dateChange;
    }

    public void setDateChange(Date dateChange) {
        this.dateChange = dateChange;
    }

    public List<AuctionEntity> getAuctionEntitys() {
        return auctionEntitys;
    }

    public void setAuctionEntitys(List<AuctionEntity> auctionEntitys) {
        this.auctionEntitys = auctionEntitys;
    }
    
}
