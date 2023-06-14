package Util;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class DatabaseUtil {
    private static JdbcTemplate jdbcTemplate;

    public static JdbcTemplate getJdbcTemplate() {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DatabaseConfig.class);
        DataSource dataSource = context.getBean(DataSource.class);
        jdbcTemplate = new JdbcTemplate(dataSource);
        return jdbcTemplate;
    }
}