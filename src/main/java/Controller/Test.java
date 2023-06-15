package Controller;

import Dao.Company;
import Service.CompanyService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class Test {

  @RequestMapping("/t1")
  public String func01() {
    System.out.println("func01 call");
    CompanyService companyService = new CompanyService();
    List<Company> companies = companyService.getList();
    for (Company company : companies) {
      System.out.println(company);
    }
    return "company/list"; // View 갈려고 시도합니다.
  }
}