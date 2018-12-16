package repository;

import entity.CustomerEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends CrudRepository<CustomerEntity, Integer> {

    CustomerEntity findByUserName(String userName);

    CustomerEntity findByPassword(String userName);

    CustomerEntity findByUserNameAndPasswordAndNameAndEmailAndAddressAndPhone(String userName, String password,
            String name, String email, String address, String phone);

    List<CustomerEntity> findByUserNameNot(String userName);

    CustomerEntity findByEmail(String email);

    CustomerEntity findByName(String name);

    @Query(value = "select * \n"
            + "from customer\n"
            + "where  name  like %?1% ", nativeQuery = true)
    List<CustomerEntity> listSearch(String search);
    
    @Query(value = "select * \n"
            + "from customer\n"
            + "where  userName  like %?1% ", nativeQuery = true)
    List<CustomerEntity> listSearch2(String search);
}
