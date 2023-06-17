package Service;

import Dao.Ratiom;
import Dao.RatiomDao;
import java.util.List;

public class RatiomService {


    private final RatiomDao RatiomDao;

    public RatiomService() {this.RatiomDao = new RatiomDao();}

    public List<Ratiom>getList(){

        return RatiomDao.findAll();
    }
}
