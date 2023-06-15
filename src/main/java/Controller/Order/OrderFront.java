package Controller.Order;

import Dao.Order;
import Service.OrderService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("order")
public class OrderFront {

  private final OrderService orderService;

  public OrderFront() {
    orderService = new OrderService();
  }

  @RequestMapping("/list")
  public ModelAndView list() {
    ModelAndView mv = new ModelAndView("Order/list");
    List<Order> orders = orderService.getList();
    mv.addObject("orders", orders);
    return mv;
  }
}
