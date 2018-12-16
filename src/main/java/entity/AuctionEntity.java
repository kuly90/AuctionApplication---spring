package entity;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import static java.time.temporal.TemporalQueries.localDate;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "auction")
public class AuctionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int auctionID;
    private double minimunPrice;
    private double reserverPrice;
    @Temporal(TemporalType.DATE)
    private Date startDate;
    private int hourStart;
    private int minuteStart;
    private int secondStart;
    private float duration;
    @Temporal(TemporalType.DATE)
    private Date dateChange;
    private int status;
    //n - 1 to Comission
    @ManyToOne()
    @JoinColumn(name = "comissionID")
    private ComissionEntity comissionEntity;
    //n - 1 goods
    @ManyToOne()
    @JoinColumn(name = "goodID")
    private GoodsEntity goodsEntity;
    //n - 1 customer
    @ManyToOne()
    @JoinColumn(name = "customerID")
    private CustomerEntity customerEntity;
    //1 - n BuildBoard
    @OneToMany(mappedBy = "auctionEntity", fetch = FetchType.LAZY)
    List<BuildBroadEntity> buildList;
    //1 - n Bids
    @OneToMany(mappedBy = "auctionEntity", fetch = FetchType.EAGER)
    List<BidsEntity> bidList;
    //1 - n Transaction
    @OneToMany(mappedBy = "auctionEntity", fetch = FetchType.LAZY)
    List<TransactionsEntity> tranList;

    //construtor
    public AuctionEntity() {
    }

    public AuctionEntity(int auctionID, double minimunPrice, double reserverPrice, Date startDate, int hourStart, int minuteStart, float duration, Date dateChange, int status, ComissionEntity comissionEntity, GoodsEntity goodsEntity, CustomerEntity customerEntity, List<BuildBroadEntity> buildList, List<BidsEntity> bidList, List<TransactionsEntity> tranList) {
        this.auctionID = auctionID;
        this.minimunPrice = minimunPrice;
        this.reserverPrice = reserverPrice;
        this.startDate = startDate;
        this.hourStart = hourStart;
        this.minuteStart = minuteStart;
        this.duration = duration;
        this.dateChange = dateChange;
        this.status = status;
        this.comissionEntity = comissionEntity;
        this.goodsEntity = goodsEntity;
        this.customerEntity = customerEntity;
        this.buildList = buildList;
        this.bidList = bidList;
        this.tranList = tranList;
    }

    //get - set
    public int getAuctionID() {
        return auctionID;
    }

    public int getHourStart() {
        return hourStart;
    }

    public void setHourStart(int hourStart) {
        this.hourStart = hourStart;
    }

    public int getMinuteStart() {
        return minuteStart;
    }

    public void setMinuteStart(int minuteStart) {
        this.minuteStart = minuteStart;
    }

    public int getSecondStart() {
        return secondStart;
    }

    public void setSecondStart(int secondStart) {
        this.secondStart = secondStart;
    }

    public void setAuctionID(int auctionID) {
        this.auctionID = auctionID;
    }

    public double getMinimunPrice() {
        return minimunPrice;
    }

    public void setMinimunPrice(double minimunPrice) {
        this.minimunPrice = minimunPrice;
    }

    public double getReserverPrice() {
        return reserverPrice;
    }

    public void setReserverPrice(double reserverPrice) {
        this.reserverPrice = reserverPrice;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }

    public Date getDateChange() {
        return dateChange;
    }

    public void setDateChange(Date dateChange) {
        this.dateChange = dateChange;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public ComissionEntity getComissionEntity() {
        return comissionEntity;
    }

    public void setComissionEntity(ComissionEntity comissionEntity) {
        this.comissionEntity = comissionEntity;
    }

    public GoodsEntity getGoodsEntity() {
        return goodsEntity;
    }

    public void setGoodsEntity(GoodsEntity goodsEntity) {
        this.goodsEntity = goodsEntity;
    }

    public CustomerEntity getCustomerEntity() {
        return customerEntity;
    }

    public void setCustomerEntity(CustomerEntity customerEntity) {
        this.customerEntity = customerEntity;
    }

    public List<BuildBroadEntity> getBuildList() {
        return buildList;
    }

    public void setBuildList(List<BuildBroadEntity> buildList) {
        this.buildList = buildList;
    }

    public List<BidsEntity> getBidList() {
        return bidList;
    }

    public void setBidList(List<BidsEntity> bidList) {
        this.bidList = bidList;
    }

    public List<TransactionsEntity> getTranList() {
        return tranList;
    }

    public void setTranList(List<TransactionsEntity> tranList) {
        this.tranList = tranList;
    }

    //get ngay
    public int getDateOfStartDate() {
        Instant instant = Instant.ofEpochMilli(startDate.getTime());
        LocalDate startDateFormat = LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalDate();
        return startDateFormat.getDayOfMonth();
    }

    //get thang
    public int getMonthOfStartDate() {
        Instant instant = Instant.ofEpochMilli(startDate.getTime());
        LocalDate startDateFormat = LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalDate();
        return startDateFormat.getMonthValue();
    }

    //get nam
    public int getYearOfStartDate() {
        Instant instant = Instant.ofEpochMilli(startDate.getTime());
        LocalDate startDateFormat = LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalDate();
        return startDateFormat.getYear();
    }

    //format minimunPrice
    public String getFormattedMinimunPrice() {
        String format = "";
        NumberFormat fmt = new DecimalFormat("###,###,###");
        format = fmt.format(minimunPrice);
        return format;
    }

    public int getCountBids() {
        int count = 0;
        for (int i = 0; i < bidList.size(); i++) {
            count++;
            int k = 0;
            for (int j = 0; j < i; j++) {
                if (bidList.get(i) == bidList.get(j)) {
                    k++;
                    break;
                }
            }
            if (k > 0) {
                count = count - k;
            }
        }
        return count;
    }

    //get day to startDate
    public int getdayToStartDate() {
        Date today = new Date();
        int a = (int) (startDate.getTime() - today.getTime()) / (1000 * 60 * 60 * 24);
        return a;
    }

    //get max bid
    public double getMaxBids() {
        double maxBid = 0;
        if (bidList.size() == 0) {
            maxBid = minimunPrice;
        } else {
            for (int i = 0; i < bidList.size(); i++) {
                for (int j = 0; j <= i; j++) {
                    if (bidList.get(i).getAmount() >= bidList.get(j).getAmount()) {
                        maxBid = bidList.get(i).getAmount();
                    }
                }
            }
        }
        return maxBid;
    }

    public String getMaxBidsFormat() {
        String format = "";
        NumberFormat fmt = new DecimalFormat("###,###,###");
        format = fmt.format(getMaxBids());
        return format;
    }

    public String getCustomerNameByMaxBid() {
        String name = "";
        if (bidList.size() == 0) {
            name = "";
        } else {
            for (int i = 0; i < bidList.size(); i++) {
                if (bidList.get(i).getAmount() == getMaxBids()) {
                    name = bidList.get(i).getCustomerEntity().getName();
                    break;
                }
            }
        }
        return name;
    }
    
    
}
