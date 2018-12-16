
package repository;

import entity.RoleEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository  extends CrudRepository<RoleEntity, Integer>{
    RoleEntity findByRoleID (int roleID);
}
