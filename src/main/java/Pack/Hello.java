package Pack;

import data.DatabaseManager;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Hello {

  public static void main(String[] args) {

    ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
    DatabaseManager databaseManager = new DatabaseManager();
    databaseManager.executeQuery();
    System.out.println("dd");
  }
}
