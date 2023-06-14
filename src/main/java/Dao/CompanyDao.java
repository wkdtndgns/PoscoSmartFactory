package Dao;

import Util.DatabaseUtil;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class CompanyDao {

  private final JdbcTemplate jdbcTemplate;
  private static final String COMPTABLE = "t_companies";

  public CompanyDao() {
    this.jdbcTemplate = DatabaseUtil.getJdbcTemplate();
  }
  private static final RowMapper<Company> COMPANY_ROW_MAPPER = (rs, rowNum) -> new Company(
      rs.getInt("id"),
      rs.getString("name"),
      rs.getInt("category"),
      rs.getString("introduction"),
      rs.getString("location"),
      rs.getInt("total_cathode_qty"),
      rs.getInt("total_anode_qty"),
      rs.getTimestamp("created_ts").toLocalDateTime()
  );

  public List<Company> findAll() {
    String sql = String.format("SELECT * from %s", COMPTABLE);
    return jdbcTemplate.query(sql, COMPANY_ROW_MAPPER);
  }
}
