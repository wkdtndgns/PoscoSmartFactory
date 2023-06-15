package Dao;

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
}
