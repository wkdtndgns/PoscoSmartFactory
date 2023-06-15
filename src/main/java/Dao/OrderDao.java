package Dao;

import Util.DatabaseUtil;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Date;

public class OrderDao {

  private final JdbcTemplate jdbcTemplate;
  private static final String ORDERTABLE = "t_orders";

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

  public List<Order> findByIds(List<Integer> orderIds) {
    String inSql = orderIds.stream()
        .map(String::valueOf)
        .collect(Collectors.joining(","));

    String sql = String.format("select tord.*, tf.cathode_production, tf.anode_production\n"
        + "from t_orders as tord\n"
        + "         left join t_factories tf on tord.factory_id = tf.id\n"
        + "          WHERE tord.id IN (%s)", inSql);

    return jdbcTemplate.query(sql, (rs, rowNum) -> new Order(
        rs.getInt("id"),
        rs.getInt("company_id"),
        rs.getInt("factory_id"),
        rs.getInt("material_id"),
        rs.getInt("qty"),
        rs.getInt("cathode_production"),
        rs.getInt("anode_production")
    ));
  }


  public void updateStatus(List<Integer> orderId, int newStatus) {
    String inSql = orderId.stream()
        .map(String::valueOf)
        .collect(Collectors.joining(","));
    String sql = String.format("UPDATE %s SET status = ? WHERE id IN (%s)", ORDERTABLE, inSql);
    jdbcTemplate.update(sql, newStatus);
  }

  public int insertOrder(Order order) {
    final String sql = String.format(
        "INSERT INTO %s (company_id, factory_id, material_id, qty, purchase_price, order_date, expected_delivery_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        ORDERTABLE);
    KeyHolder keyHolder = new GeneratedKeyHolder();

    jdbcTemplate.update(
        connection -> {
          PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
          ps.setInt(1, order.getCompanyId());
          ps.setInt(2, order.getFactoryId());
          ps.setInt(3, order.getMaterialId());
          ps.setInt(4, order.getQty());
          ps.setFloat(5, order.getPurchasePrice());
          ps.setDate(6, order.getOrderDate());
          ps.setDate(7, order.getExpectedDeliveryDate());
          ps.setInt(8, order.getStatus());
          return ps;
        },
        keyHolder);

    return keyHolder.getKey().intValue();
  }
}
