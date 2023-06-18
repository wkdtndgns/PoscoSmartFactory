package Dao;
import Util.DatabaseUtil;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

public class UserDao {

    private final JdbcTemplate jdbcTemplate;
    private static final String USERTABLE = "t_user";

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

    public User findByUserId(String userid) {
        String sql = String.format("SELECT * FROM %s WHERE userid = ?", USERTABLE);
        try {
            return jdbcTemplate.queryForObject(sql, USER_ROW_MAPPER, userid);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    public void insertUser(String userid, String password, String name) {
        String sql = "INSERT INTO t_user (userid, password, Name) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, userid, password, name);
    }
}