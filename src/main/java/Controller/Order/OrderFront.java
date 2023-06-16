package Controller.Order;

import Dao.Order;
import Service.OrderService;
import Service.ProductionService;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Controller
@RequestMapping("order")
public class OrderFront {

  private final OrderService orderService;
  public OrderFront() {
    orderService = new OrderService();
  }

  @RequestMapping("/list")
  public ModelAndView list(Optional<String> status) {
    ModelAndView mv = new ModelAndView("Order/list");
    List<Order> orders = orderService.getList(status.orElse(""));
    mv.addObject("orders", orders);
    mv.addObject("status", status.orElse(""));
    return mv;
  }
}
