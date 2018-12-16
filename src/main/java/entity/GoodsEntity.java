package entity;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "goods")
public class GoodsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int goodID;
    private String goodName;
    private String description;
    private boolean status;
    //1 - n to ImageGood
    @OneToMany(mappedBy = "goodsEntity", fetch = FetchType.EAGER)
    List<ImageGoodEntity> imageList;
    //1-n to Auction
    @OneToMany(mappedBy = "goodsEntity", fetch = FetchType.EAGER)
    List<AuctionEntity> auctionList;
    
    //Constructor
    public GoodsEntity(){}

    public GoodsEntity(int goodID, String goodName, String description, boolean status, List<ImageGoodEntity> imageList, List<AuctionEntity> auctionList) {
        this.goodID = goodID;
        this.goodName = goodName;
        this.description = description;
        this.status = status;
        this.imageList = imageList;
        this.auctionList = auctionList;
    }
    
    //get - set

    public int getGoodID() {
        return goodID;
    }

    public void setGoodID(int goodID) {
        this.goodID = goodID;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<ImageGoodEntity> getImageList() {
        return imageList;
    }

    public void setImageList(List<ImageGoodEntity> imageList) {
        this.imageList = imageList;
    }

    public List<AuctionEntity> getAuctionList() {
        return auctionList;
    }

    public void setAuctionList(List<AuctionEntity> auctionList) {
        this.auctionList = auctionList;
    }
    public String getTop1Image(){
        String image = "";
        for(int i = 0; i <imageList.size(); i ++){
            image = imageList.get(i).getImageUrl();
            break;
        }
        return image;
    }
}
