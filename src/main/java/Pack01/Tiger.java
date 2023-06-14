package Pack01;

import Dao.CompanyDao;
import Domain.Company;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Tiger {

  @RequestMapping("/t1")
  public String func01() {

    CompanyDao companyDao = new CompanyDao();
    Company company = companyDao.find(1);
    System.out.println(company);
    System.out.println("func01 call");
    return "TigerView"; // View 갈려고 시도합니다.
  }
}