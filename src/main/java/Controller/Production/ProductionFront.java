package Controller.Production;
import Controller.coreFront;
import Dao.Production;
import Service.ProductionService;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("production")
public class ProductionFront extends coreFront {

  private final ProductionService productionService;
  public ProductionFront(){
    productionService = new ProductionService();
  }

  @RequestMapping("/list")
  public ModelAndView list(Optional<String> status) {
    ModelAndView mv = new ModelAndView("Production/list");
    List<Production> productions = productionService.getList(status.orElse(""));
    mv.addObject("productions", productions);
    mv.addObject("status", status.orElse(""));
    return mv; // View 갈려고 시도합니다.
  }
}
