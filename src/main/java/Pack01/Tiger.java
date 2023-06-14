package Pack01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Tiger {

  @RequestMapping("/t1")
  public String func01() {
    System.out.println("func01 call");
    return "TigerView"; // View 갈려고 시도합니다.
  }
}