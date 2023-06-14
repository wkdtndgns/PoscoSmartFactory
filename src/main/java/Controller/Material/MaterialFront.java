package Controller.Material;

import Dao.Factory;
import Dao.Material;
import Service.FactoryService;
import Service.MaterialService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("material")
public class MaterialFront {
  @RequestMapping("/list")
  public String list() {
    System.out.println("func01 call");
    MaterialService materialService = new MaterialService();
    List<Material> materials = materialService.getList();
    for ( Material material : materials) {
      System.out.println(material);
    }
    return "TigerView"; // View 갈려고 시도합니다.
  }
}
