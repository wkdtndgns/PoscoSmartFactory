package Controller.Log;

import Dao.Factory;
import Service.LogService;
import Service.OrderService;
import Util.DatabaseUtil;
import Util.MongoUtil;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.bson.Document;
import Util.MongoConfig;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogController {

  private LogService logService;

  public LogController() {
    logService = new LogService();
  }

  @GetMapping("/logs")
  public ModelAndView list() {
    ModelAndView mv = new ModelAndView("Log/list");
    mv.addObject("list", logService.getList());
    return mv; // Returns the view
  }
}
