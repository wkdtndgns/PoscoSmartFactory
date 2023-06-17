package Service;

import Controller.Production.Vo.ProductionStatusUpdateRequest;
import Dao.Factory;
import Dao.FactoryDao;
import Dao.Order;
import Dao.OrderDao;
import Dao.Production;
import Dao.ProductionDao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

  public List<Production> getList(String status) {
    return productionDao.findAll(status);
  }

  @Transactional
  public void updateProductionStatus(ProductionStatusUpdateRequest request) {
    productionDao.updateStatus(request.getProductionIds(), request.getStatus());
    orderDao.updateStatus(request.getOrderNo(), 20);
    List<Order> orderList = orderDao.findByIds(request.getOrderNo());

    // Initialize Maps
    Map<Integer, Integer> anodeMap = new HashMap<>();
    Map<Integer, Integer> cathodeMap = new HashMap<>();

    for (Order order : orderList) {
      int factoryId = order.getFactoryId();
      if (order.getMaterialId() == 1) { // 양극재
        anodeMap.put(factoryId, anodeMap.getOrDefault(factoryId, order.getAnodeProduction()) + order.getQty());
      } else if (order.getMaterialId() == 2) { // 음극재
        cathodeMap.put(factoryId, cathodeMap.getOrDefault(factoryId, order.getCathodeProduction()) + order.getQty());
      }
    }
  }
}
