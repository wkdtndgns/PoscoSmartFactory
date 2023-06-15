package Service;

import Controller.Production.Vo.ProductionStatusUpdateRequest;
import Dao.OrderDao;
import Dao.Production;
import Dao.ProductionDao;
import java.util.List;

public class ProductionService {

  private final ProductionDao productionDao;
  private final OrderDao orderDao;

  public ProductionService() {
    this.productionDao = new ProductionDao();
    this.orderDao = new OrderDao();
  }

  public List<Production> getList() {
    return productionDao.findAll();
  }

  public void updateProductionStatus(ProductionStatusUpdateRequest request) {
    productionDao.updateStatus(request.getProductionIds(), request.getStatus());
    orderDao.updateStatus(request.getOrderNo(), 20);
  }
}
