package Dao;

import Util.DatabaseUtil;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MaterialDao {

  private final JdbcTemplate jdbcTemplate;
  private static final String MATERIALTABLE = "t_materials";  // Assuming 't_materials' is the table name

  public MaterialDao() {
    this.jdbcTemplate = DatabaseUtil.getJdbcTemplate();
  }

  private static final RowMapper<Material> MATERIAL_ROW_MAPPER = (rs, rowNum) -> new Material(
      rs.getInt("id"),
      rs.getString("name"),
      rs.getString("description"),
      rs.getTimestamp("created_ts").toLocalDateTime()
  );

  public List<Material> findAll() {
    String sql = String.format("SELECT * from %s", MATERIALTABLE);
    return jdbcTemplate.query(sql, MATERIAL_ROW_MAPPER);
  }
}
