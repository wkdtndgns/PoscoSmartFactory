package Dao;

import Util.DatabaseUtil;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class OrderDao {

  private final JdbcTemplate jdbcTemplate;
  private static final String ORDERTABLE = "t_orders";  // Assuming 't_orders' is the table name

  public OrderDao() {
    this.jdbcTemplate = DatabaseUtil.getJdbcTemplate();
  }

  private static final RowMapper<Order> ORDER_ROW_MAPPER = (rs, rowNum) -> new Order(
      rs.getInt("id"),
      rs.getInt("company_id"),
      rs.getInt("factory_id"),
      rs.getInt("material_id"),
      rs.getInt("qty"),
      rs.getFloat("purchase_price"),
      rs.getDate("order_date"),
      rs.getDate("expected_delivery_date"),
      rs.getInt("status"),
      rs.getTimestamp("created_ts").toLocalDateTime(),
      rs.getString("factory_name"),
      rs.getString("company_name"),
      rs.getString("material_name")
  );

  public List<Order> findAll() {
    String sql = String.format("select tord.*, tf.name as factory_name, tc.name as company_name, tm.name as material_name\n"
        + "from t_orders as tord\n"
        + "         left join t_factories tf on tord.factory_id = tf.id\n"
        + "         left join t_materials tm on tord.material_id = tm.id\n"
        + "         left join t_companies tc on tord.company_id = tc.id");

    return jdbcTemplate.query(sql, ORDER_ROW_MAPPER);
  }

  public void updateStatus(List<Integer>  orderId, int newStatus) {
    String inSql = orderId.stream()
        .map(String::valueOf)
        .collect(Collectors.joining(","));
    String sql = String.format("UPDATE %s SET status = ? WHERE id IN (%s)", ORDERTABLE, inSql);
    jdbcTemplate.update(sql, newStatus);
  }
}
