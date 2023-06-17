package Controller.Factory;

import Dao.Factory;
import Service.FactoryService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("factory")
public class FactoryFront {

  private final FactoryService factoryService;

  public FactoryFront(){
    factoryService = new FactoryService();
  }

  @RequestMapping("/list")
  public ModelAndView list() {
    ModelAndView mv = new ModelAndView("Factory/list");
    List<Factory> factories = factoryService.getList();
    mv.addObject("factories", factories);
    return mv; // Returns the view
  }

  @RequestMapping("/production")
  public String production(){
    return "Factory/production";
  }
}
