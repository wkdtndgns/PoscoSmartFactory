package Controller;
import Dao.Factory;
import Dao.Company;
import Service.CompanyService;
import Service.FactoryService;
import Service.OrderService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Index {

  private final FactoryService factoryService;

  private final OrderService orderService;

  public Index() {
    orderService = new OrderService();
    factoryService = new FactoryService();
  }

  @RequestMapping("/")
  public String first() {
    return "redirect:/User/Login"; // View 갈려고 시도합니다.
  }

  /*

     */
    @RequestMapping("/home")
    public ModelAndView index() {
      ModelAndView mv = new ModelAndView("index");
      mv.addObject("totalCost", orderService.getTotalCost());
      mv.addObject("factoryProduction", factoryService.getFactoryProduction());
      mv.addObject("factoryProductionById", factoryService.getFactoryProductionById());
      return mv; // View 갈려고 시도합니다.
    }

}
