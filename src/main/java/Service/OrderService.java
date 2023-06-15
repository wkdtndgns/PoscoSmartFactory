package Service;

import Dao.Order;
import Dao.OrderDao;
import java.util.List;

public class OrderService {

  private final OrderDao orderDao;

  public OrderService() {
    this.orderDao = new OrderDao();
  }

  public List<Order> getList() {
    return orderDao.findAll();
  }

  public void updateOrderStatus(List<Integer> orderId, int newStatus) {
    orderDao.updateStatus(orderId, newStatus);
  }
}