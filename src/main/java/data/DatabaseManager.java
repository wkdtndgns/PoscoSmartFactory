package data;
import org.springframework.jdbc.core.JdbcTemplate;
import javax.sql.DataSource;

public class DatabaseManager {

    private JdbcTemplate jdbcTemplate;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void executeQuery() {
        String sql = "SELECT * FROM table01";
        jdbcTemplate.query(sql, (resultSet) -> {
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                // 결과 처리 로직: 가져온 name 값을 사용하여 원하는 작업을 수행합니다.
                System.out.println(name);
            }
        });
    }

}
