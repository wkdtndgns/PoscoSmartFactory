package Dao;

import Controller.Factory.Vo.FactoryProduction;
import Util.DatabaseUtil;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class FactoryDao {

  private final JdbcTemplate jdbcTemplate;
  private static final String FACTORYTABLE = "t_factories";  // Assuming 't_factories' is the table name

  public FactoryDao() {
    this.jdbcTemplate = DatabaseUtil.getJdbcTemplate();
  }

  private static final RowMapper<Factory> FACTORY_ROW_MAPPER = (rs, rowNum) -> new Factory(
      rs.getInt("id"),
      rs.getString("name"),
      rs.getString("location"),
      rs.getInt("cathode_production"),
      rs.getInt("anode_production"),
      rs.getInt("cathode_stock"),
      rs.getInt("anode_stock"),
      rs.getTimestamp("created_ts").toLocalDateTime()
  );

  private static final RowMapper<FactoryProduction> FACTORY_PRODUCTION_ROW_MAPPER = (rs, rowNum) -> new FactoryProduction(
      rs.getInt("totalAnodeProduction"),
      rs.getInt("totalCathodeProduction")
  );

  public List<Factory> findAll() {
    String sql = String.format("SELECT * from %s", FACTORYTABLE);
    return jdbcTemplate.query(sql, FACTORY_ROW_MAPPER);
  }


  public void updateCathodeProduction(int factoryId, int cathodeProduction) {
    System.out.println(cathodeProduction);
    System.out.println(factoryId);
    String sql = String.format("UPDATE %s SET cathode_production = ? WHERE id = ?", FACTORYTABLE);
    jdbcTemplate.update(sql, cathodeProduction, factoryId);
  }

  public void updateAnodeProduction(int factoryId, int anodeProduction) {
    String sql = String.format("UPDATE %s SET anode_production = ? WHERE id = ?", FACTORYTABLE);
    jdbcTemplate.update(sql, anodeProduction, factoryId);
  }

  public List<FactoryProduction> getFactoryProductionById() {
    String sql = "SELECT id,name, SUM(cathode_production) as totalCathodeProduction, SUM(anode_production) as totalAnodeProduction FROM t_factories GROUP BY id";

    return jdbcTemplate.query(sql, (resultSet, i) -> {
      String name = resultSet.getString("name");
      int totalCathodeProduction = resultSet.getInt("totalCathodeProduction");
      int totalAnodeProduction = resultSet.getInt("totalAnodeProduction");

      return new FactoryProduction(name, totalCathodeProduction, totalAnodeProduction);
    });
  }

  public FactoryProduction getFactoryProduction() {
    String sql = "SELECT SUM(cathode_production) as totalCathodeProduction, SUM(anode_production) as totalAnodeProduction FROM t_factories";

    return jdbcTemplate.queryForObject(sql, FACTORY_PRODUCTION_ROW_MAPPER);
  }

  public int getProductionByIdAndTemp(int id, int temp) {
    String sql = String.format("SELECT %s FROM t_factories WHERE id = ?",
            (temp == 1) ? "cathode_production" : "anode_production");

    return jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
  }
  public void updateProductionByIdAndTemp(int factoryId, int temp, int orderQty) {
    String columnName = (temp == 1) ? "cathode_production" : "anode_production";
    String sql = String.format("UPDATE %s SET %s = %s - ? WHERE id = ?", FACTORYTABLE, columnName, columnName);
    System.out.println(orderQty);
    System.out.println(columnName);
    jdbcTemplate.update(sql, orderQty, factoryId);
  }


}
