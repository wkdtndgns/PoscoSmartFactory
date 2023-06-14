package Pack;

import data.Util.DatabaseConfig;
import data.Util.DatabaseUtil;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.sql.DataSource;
import java.util.List;

public class Hello {

  public static void main(String[] args) {
    AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DatabaseConfig.class);

    // Retrieve the DataSource bean from the context
    DataSource dataSource = context.getBean(DataSource.class);

    DatabaseUtil databaseUtil = new DatabaseUtil(dataSource);
    databaseUtil.connect();
    List<String> names = databaseUtil.getAllNames();
    System.out.println("dd");
  }
}
