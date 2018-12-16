
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
@Table(name = "userrole")
public class RoleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int roleID;
    private String roleName;
    
    @OneToMany(mappedBy = "roleEntity", fetch = FetchType.EAGER)
    List<CustomerEntity> cusList;

    public RoleEntity() {
    }

    public RoleEntity(int roleID, String roleName) {
        this.roleID = roleID;
        this.roleName = roleName;
    }

    public RoleEntity(String roleName, List<CustomerEntity> cusList) {
        this.roleName = roleName;
        this.cusList = cusList;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<CustomerEntity> getCusList() {
        return cusList;
    }

    public void setCusList(List<CustomerEntity> cusList) {
        this.cusList = cusList;
    }
    
    
}
