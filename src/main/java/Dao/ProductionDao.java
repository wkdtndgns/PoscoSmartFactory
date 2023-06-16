package Dao;

import Util.DatabaseUtil;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class ProductionDao {

  private final JdbcTemplate jdbcTemplate;
  private static final String PRODUCTIONTABLE = "t_production";

  public ProductionDao() {
    this.jdbcTemplate = DatabaseUtil.getJdbcTemplate();
  }

  private static final RowMapper<Production> PRODUCTION_ROW_MAPPER = (rs, rowNum) -> new Production(
      rs.getInt("id"),
      rs.getInt("order_id"),
      rs.getInt("factory_id"),
      rs.getInt("qty"),
      rs.getDate("start_date"),
      rs.getDate("expected_completion_date"),
      rs.getInt("status"),
      rs.getTimestamp("created_ts").toLocalDateTime(),
      rs.getString("order_id"),
      rs.getString("factory_name"),
      rs.getString("company_name"),
      rs.getString("material_name")
  );

  public List<Production> findAll() {
    String sql = String.format("select *, tc.name as company_name, tm.name as material_name, tord.id as order_id, tf.name as factory_name\n"
        + "from t_production as tp\n"
        + " left join t_factories tf on tp.factory_id = tf.id\n"
        + " left join t_orders tord on tord.id = tp.order_id\n"
        + " left join t_companies tc on tc.id = tord.company_id\n"
        + " left join t_materials tm on tord.material_id = tm.id\n"
        + " order by tp.id desc "
    );
    return jdbcTemplate.query(sql, PRODUCTION_ROW_MAPPER);
  }

  public void updateStatus(List<Integer> productionIds, int newStatus) {
    String inSql = productionIds.stream()
        .map(String::valueOf)
        .collect(Collectors.joining(","));
    String sql = String.format("UPDATE %s SET status = ? WHERE id IN (%s)", PRODUCTIONTABLE, inSql);
    jdbcTemplate.update(sql, newStatus);
  }

  public void insertProduction(Production production) {
    String sql = String.format("INSERT INTO %s (order_id, factory_id, qty, start_date, expected_completion_date, status) VALUES (?, ?, ?, ?, ?, ?)",
        PRODUCTIONTABLE);
    jdbcTemplate.update(sql, production.getOrderId(), production.getFactoryId(), production.getQty(), production.getStartDate(),
        production.getExpectedCompletionDate(), production.getStatus());
  }
}
