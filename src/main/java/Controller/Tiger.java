package Controller;

import Dao.Company;
import Dao.CompanyDao;
import Service.CompanyService;
import Util.*;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.util.List;

@Controller
public class Tiger {

  @RequestMapping("/t1")
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