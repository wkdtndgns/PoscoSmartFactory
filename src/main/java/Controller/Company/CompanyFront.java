package Controller.Company;

import Dao.Company;
import Service.CompanyService;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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

    return mv;
  }


  @RequestMapping("/companyhome")
  public ModelAndView companyhome() {
    ModelAndView mv = new ModelAndView("Company/companyhome");
    return mv;
  }
  @RequestMapping("/companyorder")
  public ModelAndView companyorder() {
    ModelAndView mv = new ModelAndView("Company/companyorder");
    return mv;
  }

  @RequestMapping("/ordercheck")
  public ModelAndView ordercheck(Optional<String> status) {
    ModelAndView mv = new ModelAndView("Company/ordercheck");
    mv.addObject("status", status.orElse(""));
    return mv;
  }
}
