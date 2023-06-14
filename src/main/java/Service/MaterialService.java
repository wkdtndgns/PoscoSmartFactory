package Service;

import Dao.Material;
import Dao.MaterialDao;
import java.util.List;

public class MaterialService {

  private final MaterialDao materialDao;

  public MaterialService() {
    this.materialDao = new MaterialDao();
  }

  public List<Material> getList() {
    return materialDao.findAll();
  }
}
