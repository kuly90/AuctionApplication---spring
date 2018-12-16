package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "imagegood")
public class ImageGoodEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    //n-1 to Goods
    @ManyToOne
    @JoinColumn(name = "goodID")
    private GoodsEntity goodsEntity;
    
    private String imageUrl;
    
    //constructor
    public ImageGoodEntity(){}
    public ImageGoodEntity(int id, GoodsEntity goodsEntity, String imageUrl) {
        this.id = id;
        this.goodsEntity = goodsEntity;
        this.imageUrl = imageUrl;
    }
    
    //get - set

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public GoodsEntity getGoodsEntity() {
        return goodsEntity;
    }

    public void setGoodsEntity(GoodsEntity goodsEntity) {
        this.goodsEntity = goodsEntity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    
}
