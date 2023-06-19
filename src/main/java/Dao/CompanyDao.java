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
  public void insertCompany(String name, int category, String introduction, String location) {
    String sql = "INSERT INTO t_companies (name, category, introduction, location) VALUES (?, ?, ?, ?)";
    jdbcTemplate.update(sql, name, category, introduction, location);
  }
  public Integer findCompanyIdByName(String name) {
    String sql = "SELECT id FROM t_companies WHERE name = ?";
    List<Integer> ids = jdbcTemplate.query(sql, new Object[] { name }, (rs, rowNum) -> rs.getInt("id"));

    Integer id = null;
    if(!ids.isEmpty()) {
      id = ids.get(0);
    }

    System.out.println(id);
    return id;
  }
}
