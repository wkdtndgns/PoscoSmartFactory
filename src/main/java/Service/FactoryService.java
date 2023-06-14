package Service;

import Dao.Factory;
import Dao.FactoryDao;
import java.util.List;

public class FactoryService {

  private final FactoryDao factoryDao;

  public FactoryService() {
    this.factoryDao = new FactoryDao();
  }

  public List<Factory> getList() {
    return factoryDao.findAll();
  }
}
