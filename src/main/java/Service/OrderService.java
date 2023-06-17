package Service;

import Dao.*;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

public class OrderService {

  private final OrderDao orderDao;
  private final ProductionDao productionDao;

  public OrderService() {
    this.productionDao = new ProductionDao();
    this.orderDao = new OrderDao();
  }

  public List<Order> getList(String status) {
    return orderDao.findAll(status);
  }

  public void updateOrderStatus(List<Integer> orderId, int newStatus) {
    orderDao.updateStatus(orderId, newStatus);
  }

  @Transactional
  public int registerOrder(Order order) {
    LocalDateTime localDateTimeNow = LocalDateTime.now();
    Date startDate = Date.valueOf(localDateTimeNow.toLocalDate());
    Date expectedDeliveryDate = Date.valueOf(localDateTimeNow.plusDays(7).toLocalDate()); // Set expected delivery date 7 days from now
    Date expectedDDate = Date.valueOf(localDateTimeNow.plusDays(3).toLocalDate()); // Set expected delivery date 7 days from now

    /*
    재고가 있으면 공장에 있는 수량 - 상태는 발송
      1.음극재인지 양극재인지 체크 공장체크 공장에 있는 수량 뽑아오기
      수량 뽑아오고 그 수량이 주문 수량보다 많으면 status 20
      그반대면 10
      공장의 수량 감소시키기->

    * */

    // Create an Order object for testing
//    Order order = new Order(
//        1,                   // companyId
//        1,                   // factoryId
//        1,                   // materialId
//        400,                   // qty
//        500.0f,                // purchasePrice
//        startDate,             // orderDate
//        expectedDeliveryDate,  // expectedDeliveryDate
//        10                     // status
//    );
    int id = orderDao.insertOrder(order);
    FactoryDao factoryDao= new FactoryDao();
    int temp=factoryDao.getProductionByIdAndTemp(order.getFactoryId(),order.getMaterialId());
    int stockOrder;
    if(order.getQty()<=temp){
      /*
      order_id를 통해 order 상태 20으로 업데이트하고

      팩토리에 재고 빼기
        factory_id, Materal_id, order.getQty()주면 해당하는 값 마이너스하기
      * */
      orderDao.updateStatusById(id,20);
      factoryDao.updateProductionByIdAndTemp(order.getFactoryId(),order.getMaterialId(),order.getQty());
      //업데이트
      Production production = new Production(id, order.getFactoryId(), order.getQty(), startDate, expectedDDate, 20);
      productionDao.insertProduction(production);
    stockOrder= 1;
    }else{
      Production production = new Production(id, order.getFactoryId(), order.getQty(), startDate, expectedDDate, 10);
      productionDao.insertProduction(production);
      stockOrder= 0;
    }

    return stockOrder;
  }

  public float getTotalCost() {
    return orderDao.getTotalCost();
  }
}
