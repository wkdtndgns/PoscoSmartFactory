package Service;

import Dao.Company;
import Dao.CompanyDao;
import java.util.List;

public class CompanyService {

  private final CompanyDao companyDao;

  public CompanyService() {
    this.companyDao = new CompanyDao();
  }

  public List<Company> getList() {
    return companyDao.findAll();
  }
}
