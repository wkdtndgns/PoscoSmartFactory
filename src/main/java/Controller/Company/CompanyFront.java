package Controller.Company;

import Dao.Company;
import Service.CompanyService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("company")
public class CompanyFront {

  private final CompanyService companyService;

  public CompanyFront() {
    companyService = new CompanyService();
  }

  @RequestMapping("/list")
  public ModelAndView list() {
    ModelAndView mv = new ModelAndView("Company/list");
    List<Company> companies = companyService.getList();
    mv.addObject("companies", companies);
    mv.addObject("limit", 10);
    mv.addObject("page", 1);
    mv.addObject("totalPage", 2);
    mv.addObject("search", "");

    return mv;
  }
}
