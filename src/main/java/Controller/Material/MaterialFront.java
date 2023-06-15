package Controller.Material;

import Dao.Company;
import Dao.Factory;
import Dao.Material;
import Service.CompanyService;
import Service.FactoryService;
import Service.MaterialService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("material")
public class MaterialFront {

  private final MaterialService materialService;
  public MaterialFront(){
    materialService = new MaterialService();
  }

  @RequestMapping("/list")
  public ModelAndView list() {
    ModelAndView mv = new ModelAndView("Material/list");
    List<Material> materials = materialService.getList();
    mv.addObject("materials", materials);
    return mv; // View 갈려고 시도합니다.
  }
}
