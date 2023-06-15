package Service;

import Controller.Production.Vo.ProductionStatusUpdateRequest;
import Dao.Factory;
import Dao.FactoryDao;
import Dao.Order;
import Dao.OrderDao;
import Dao.Production;
import Dao.ProductionDao;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

public class ProductionService {

  private final ProductionDao productionDao;
  private final OrderDao orderDao;
  private final FactoryDao factoryDao;

  public ProductionService() {
    this.productionDao = new ProductionDao();
    this.orderDao = new OrderDao();
    this.factoryDao = new FactoryDao();
  }

  public List<Production> getList() {
    return productionDao.findAll();
  }


  @Transactional
  public void updateProductionStatus(ProductionStatusUpdateRequest request) {
    productionDao.updateStatus(request.getProductionIds(), request.getStatus());
    orderDao.updateStatus(request.getOrderNo(), 20);

    List<Order> orderList = orderDao.findByIds(request.getOrderNo());
    for (Order order : orderList) {
      System.out.println(order);
      if (order.getMaterialId() == 1) { // 양극재
        factoryDao.updateAnodeProduction(order.getFactoryId(), order.getAnodeProduction() + order.getQty());
      } else if (order.getMaterialId() == 2) { // 음극재
        factoryDao.updateCathodeProduction(order.getFactoryId(), order.getCathodeProduction() + order.getQty());
      }
    }
  }
}
