package Service;

import Dao.Log;
import Dao.LogDao;
import java.util.List;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class LogService {

  @Autowired
  private LogDao logDao;

  public LogService() {
    logDao = new LogDao();
  }

  public void saveLog(String message) {
    Log log = new Log(message);
    logDao.saveLog(log);
  }

  public List<Document> getList() {
    return logDao.findAll();
  }
}
