package Dao;
import Util.DatabaseUtil;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

public class UserDao {

    private final JdbcTemplate jdbcTemplate;
    private static final String USERTABLE = "user";

    public UserDao() {
        this.jdbcTemplate = DatabaseUtil.getJdbcTemplate();
    }

    private static final RowMapper<User> USER_ROW_MAPPER = (rs, rowNum) -> new User(
            rs.getString("userid"),
            rs.getString("password"),
            rs.getBoolean("is_approved"),
            rs.getString("Name")
    );

    public List<User> findAll() {
        String sql = String.format("SELECT * FROM %s", USERTABLE);
        return jdbcTemplate.query(sql, USER_ROW_MAPPER);
    }
}