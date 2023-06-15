package Dao;

import Util.DatabaseUtil;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class ProductionDao {

  private final JdbcTemplate jdbcTemplate;
  private static final String PRODTABLE = "t_production";

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
      rs.getString("factory_name")
  );

  public List<Production> findAll() {
    String sql = String.format("select *, tf.name as factory_name\n"
        + "from t_production as tp\n"
        + " left join t_factories tf on tp.factory_id = tf.id\n"
        + " left join t_orders tord on tord.id = tp.order_id");
    return jdbcTemplate.query(sql, PRODUCTION_ROW_MAPPER);
  }
}
