package Service;

import Controller.Factory.Vo.FactoryProduction;
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

  public FactoryProduction getFactoryProduction() {
    return factoryDao.getFactoryProduction();
  }
  public List<FactoryProduction> getFactoryProductionById() {
    return factoryDao.getFactoryProductionById();
  }
}
