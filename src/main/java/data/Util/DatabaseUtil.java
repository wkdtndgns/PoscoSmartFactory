package data.Util;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.util.List;

public class DatabaseUtil {
    private JdbcTemplate jdbcTemplate;

    public DatabaseUtil(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void connect() {
        // 데이터베이스 연결 설정
        String url = "jdbc:mysql://localhost:3306/db01";
        String username = "root";
        String password = "1234";
        jdbcTemplate.setDataSource(new DriverManagerDataSource(url, username, password));
        // 데이터베이스 연결
    }
    public List<String> getAllNames() {
        String sql = "SELECT name FROM table01";
        List<String> names = jdbcTemplate.queryForList(sql, String.class);
        return names;
    }
}