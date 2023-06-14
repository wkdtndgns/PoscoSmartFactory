package Test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnectionTest {
  public static void main(String[] args) {
    String url = "jdbc:mysql://localhost:3306/SmartFactory";
    String username = "root";
    String password = "1234";

    try (Connection connection = DriverManager.getConnection(url, username, password)) {
      System.out.println("Database connected!");
      Statement stmt = connection.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM t_companies");

      while (rs.next()) {
        System.out.println(rs.getString("name"));
      }
    } catch (SQLException e) {
      throw new IllegalStateException("Cannot connect the database!", e);
    }
  }
}
