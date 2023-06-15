package Controller.Order;

import Controller.Order.Vo.OrderStatusUpdateRequest;
import Service.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "null")
@RequestMapping("order")
public class OrderAction {

  private final OrderService orderService;

  public OrderAction() {
    this.orderService = new OrderService();
  }
  @PostMapping("updateStatus")
  public boolean updateStatus(@RequestBody OrderStatusUpdateRequest request) {
      orderService.updateOrderStatus(request.getOrderId(), request.getStatus());
      return true;
  }
}
