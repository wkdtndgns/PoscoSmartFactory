package Controller.Production;

import Dao.Production;
import Service.ProductionService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("production")
public class ProductionFront {

  private final ProductionService productionService;
  public ProductionFront(){
    productionService = new ProductionService();
  }

  @RequestMapping("/list")
  public ModelAndView list() {
    ModelAndView mv = new ModelAndView("Production/list");
    List<Production> productions = productionService.getList();
    mv.addObject("productions", productions);
    return mv; // View 갈려고 시도합니다.
  }
}
