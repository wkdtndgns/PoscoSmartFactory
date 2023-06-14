package Dao;

import Domain.Company;
import javax.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class CompanyDao {

  @PersistenceContext
  private EntityManager entityManager;
  public Company find(int id) {
    System.out.println(id);
    Company company = entityManager.find(Company.class, id);
    if (company == null) {
      throw new EntityNotFoundException("Could not find company with id " + id);
    }
    return company;
  }


  // add other CRUD operations as needed
}
