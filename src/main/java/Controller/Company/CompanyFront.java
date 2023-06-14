package Controller.Company;

import Dao.Company;
import Service.CompanyService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("company")
public class CompanyFront {
  @RequestMapping("/list")
  public String func01() {
    System.out.println("func01 call");
    CompanyService companyService = new CompanyService();
    List<Company> companies = companyService.getList();
    for (Company company : companies) {
      System.out.println(company);
    }
    return "TigerView"; // View 갈려고 시도합니다.
  }
}
