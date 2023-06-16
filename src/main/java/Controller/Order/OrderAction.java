package Controller.Order;

import Controller.Order.Vo.OrderStatusUpdateRequest;
import Dao.CompanyDao;
import Dao.Order;
import Service.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDateTime;

@RestController
@CrossOrigin(origins = "null")
@RequestMapping("order")
public class OrderAction {

  private final OrderService orderService;

  public OrderAction() {
    this.orderService = new OrderService();
  }
  @PostMapping("updateStatus")
  public boolean updateStatus(@RequestBody OrderStatusUpdateRequest request) {
      orderService.updateOrderStatus(request.getOrderId(), request.getStatus());
      return true;
  }


    @PostMapping("orderAction")
    public boolean orderAction(HttpServletRequest request) {
        String totalPrice = request.getParameter("totalPrice");
        String quantityNegative = request.getParameter("quantityNegative");
        String factoryOption = request.getParameter("factoryOption");
        String factory_id = request.getParameter("factoryId");
        String nameUser = null;
        HttpSession nSession = request.getSession(false); // 새로운 세션을 생성하지 않고 현재 세션을 가져옴
        if (nSession != null) {
            nameUser = (String) nSession.getAttribute("username");
        }

        CompanyDao companyDao = new CompanyDao();
        int comapny_id=companyDao.findCompanyIdByName(nameUser);
        int marterial_id =2;

        LocalDateTime localDateTimeNow = LocalDateTime.now();
        Date startDate = Date.valueOf(localDateTimeNow.toLocalDate());
        Date expectedDeliveryDate = Date.valueOf(localDateTimeNow.plusDays(7).toLocalDate()); // Set expected delivery date 7 days from now
        Date expectedDDate = Date.valueOf(localDateTimeNow.plusDays(3).toLocalDate()); // Set expected delivery date 7 days from now
        int fac_id = Integer.parseInt(factory_id);
        int q_Negative = Integer.parseInt(quantityNegative);

        double total_Price = Double.parseDouble(totalPrice);
        int integerValue = (int) total_Price;

// 소숫점 이전의 값 가져오기
        String result = String.valueOf(integerValue);
        System.out.println(result);

        Order order = new Order(comapny_id,fac_id,marterial_id,q_Negative,integerValue,startDate,expectedDeliveryDate,10);
        OrderService orderService = new OrderService();
        orderService.registerOrder(order);

        return true;
    }
    @PostMapping("orderActionPositive")
    public boolean orderActionPositive(HttpServletRequest request) {
        String totalPrice = request.getParameter("totalPrice");
        String quantityPositive = request.getParameter("quantityPositive");
        String factoryOption = request.getParameter("factoryOption");
        String factory_id = request.getParameter("factoryId");
        String nameUser = null;
        HttpSession nSession = request.getSession(false); // 새로운 세션을 생성하지 않고 현재 세션을 가져옴
        if (nSession != null) {
            nameUser = (String) nSession.getAttribute("username");
        }
        CompanyDao companyDao = new CompanyDao();
        int comapny_id=companyDao.findCompanyIdByName(nameUser);
        int marterial_id =1;

        LocalDateTime localDateTimeNow = LocalDateTime.now();
        Date startDate = Date.valueOf(localDateTimeNow.toLocalDate());
        Date expectedDeliveryDate = Date.valueOf(localDateTimeNow.plusDays(7).toLocalDate()); // Set expected delivery date 7 days from now
        Date expectedDDate = Date.valueOf(localDateTimeNow.plusDays(3).toLocalDate()); // Set expected delivery date 7 days from now
        int fac_id = Integer.parseInt(factory_id);
        int q_Positive = Integer.parseInt(quantityPositive);

        double total_Price = Double.parseDouble(totalPrice);
        int integerValue = (int) total_Price;

// 소숫점 이전의 값 가져오기
        String result = String.valueOf(integerValue);
        System.out.println(result);

        Order order = new Order(comapny_id,fac_id,marterial_id,q_Positive,integerValue,startDate,expectedDeliveryDate,10);
        OrderService orderService = new OrderService();
        orderService.registerOrder(order);

        return true;
    }
}
