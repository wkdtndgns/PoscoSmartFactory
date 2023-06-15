package Service;

import Dao.Production;
import Dao.ProductionDao;
import java.util.List;

public class ProductionService {

  private final ProductionDao productionDao;

  public ProductionService() {
    this.productionDao = new ProductionDao();
  }

  public List<Production> getList() {
    return productionDao.findAll();
  }
}
