package Controller;

import Dao.Company;
import Service.CompanyService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {

  @RequestMapping("/")
  public String index() {
    return "index"; // View 갈려고 시도합니다.
  }
}
