package repository;

import entity.CreditCardEntity;
import entity.CustomerEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CreditCardRepository extends CrudRepository<CreditCardEntity, Integer>{
    CreditCardEntity findByNumberAccount(String numberAccount);
    CreditCardEntity findByCustomerEntity(CustomerEntity customer);
    CreditCardEntity findByCustomerID(int customerID);
}
