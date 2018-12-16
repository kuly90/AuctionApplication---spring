package entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class CustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int customerID;
    private String name;
    private String phone;
    private String address;
    private String userName;
    private String password;
    private String email;
    private boolean status;
    
    @OneToMany(mappedBy = "customerEntity", fetch = FetchType.EAGER)
    List<BuildBroadEntity> buildList;
    
    @OneToMany(mappedBy = "customerEntity", fetch = FetchType.EAGER)
    List<AuctionEntity> auctionList;
    
    @OneToMany(mappedBy = "customerEntity", fetch = FetchType.EAGER)
    List<BidsEntity> bidList;
    
    @ManyToOne
    @JoinColumn(name = "roleID")
    private RoleEntity roleEntity;

    public RoleEntity getRoleEntity() {
        return roleEntity;
    }

    
    
    public void setRoleEntity(RoleEntity roleEntity) {
        this.roleEntity = roleEntity;
    }
    
    

    @OneToOne(cascade = (CascadeType.ALL))
    @PrimaryKeyJoinColumn
    private CreditCardEntity creditCardEntity;
    
    
    public CustomerEntity(){}
    

    public int getCustomerID() {
        return customerID;
    }

    public CustomerEntity(String name, String phone, String address, String userName, String password, String email, boolean status, List<BuildBroadEntity> buildList, List<AuctionEntity> auctionList, List<BidsEntity> bidList, RoleEntity roleEntity, CreditCardEntity creditCardEntity) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.status = status;
        this.buildList = buildList;
        this.auctionList = auctionList;
        this.bidList = bidList;
        this.roleEntity = roleEntity;
        this.creditCardEntity = creditCardEntity;
    }

    public CustomerEntity(String name, String phone, String address, String userName, String password, String email, boolean status, RoleEntity roleEntity, CreditCardEntity creditCardEntity) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.status = status;
        this.roleEntity = roleEntity;
        this.creditCardEntity = creditCardEntity;
    }
    
    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<BuildBroadEntity> getBuildList() {
        return buildList;
    }

    public void setBuildList(List<BuildBroadEntity> buildList) {
        this.buildList = buildList;
    }

    public List<AuctionEntity> getAuctionList() {
        return auctionList;
    }

    public void setAuctionList(List<AuctionEntity> auctionList) {
        this.auctionList = auctionList;
    }

    public List<BidsEntity> getBidList() {
        return bidList;
    }

    public void setBidList(List<BidsEntity> bidList) {
        this.bidList = bidList;
    }

    public CreditCardEntity getCreditCardEntity() {
        return creditCardEntity;
    }

    public void setCreditCardEntity(CreditCardEntity creditCardEntity) {
        this.creditCardEntity = creditCardEntity;
    }
}
