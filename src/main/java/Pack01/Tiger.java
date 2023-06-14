package Pack01;

import data.Util.DatabaseConfig;
import data.Util.DatabaseUtil;
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
    AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DatabaseConfig.class);

    // Retrieve the DataSource bean from the context
    DataSource dataSource = context.getBean(DataSource.class);

    DatabaseUtil databaseUtil = new DatabaseUtil(dataSource);
    databaseUtil.connect();
    List<String> names = databaseUtil.getAllNames();

    // 가져온 이름 출력
    for (String name : names) {
      System.out.println(name);
    }
    return "TigerView"; // View 갈려고 시도합니다.
  }
}