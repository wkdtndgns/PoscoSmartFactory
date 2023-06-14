package Controller.Factory;

import Dao.Company;
import Dao.Factory;
import Service.CompanyService;
import Service.FactoryService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("factory")
public class FactoryFront {
  @RequestMapping("/list")
  public String list() {
    System.out.println("func01 call");
    FactoryService factoryService  = new FactoryService();
    List<Factory> factories = factoryService.getList();
    for (Factory factory : factories) {
      System.out.println(factory);
    }
    return "TigerView"; // View 갈려고 시도합니다.
  }
}
