package Dao;

import Util.DatabaseUtil;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import java.util.List;

public class RatiomDao {

    private final JdbcTemplate jdbcTemplate;

    private static final String RATIOMTABLE = "t_cathodeRatios";

    public RatiomDao() {this.jdbcTemplate = DatabaseUtil.getJdbcTemplate();}

    private static final RowMapper<Ratiom>RATIOM_ROW_MAPPER = (rs,rowNum) -> new Ratiom(
            rs.getInt("id"),
            rs.getFloat("lithium"),
            rs.getFloat("nickel"),
            rs.getFloat("cobalt"),
            rs.getFloat("manganese"),
            rs.getFloat("aluminium"),
            rs.getTimestamp("created_ts").toLocalDateTime()

    );
    public List<Ratiom> findAll(){
        String sql = String.format("select * from %s",RATIOMTABLE );
        return jdbcTemplate.query(sql,RATIOM_ROW_MAPPER);
    }
}
