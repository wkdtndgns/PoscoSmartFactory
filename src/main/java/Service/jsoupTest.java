package Service;
import Dao.CompanyDao;
import Dao.FactoryDao;
import Dao.Order;
import Dao.OrderDao;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.List;

public class jsoupTest {
    public static void main(String argsr[]){
        FactoryDao factoryDao= new FactoryDao();

        factoryDao.updateProductionByIdAndTemp(1,1,30);
//        OrderDao orderDao= new OrderDao();
//        CompanyDao companyDao=new CompanyDao();
//        String nameUser = (String) session.getAttribute("username");
//        int num=companyDao.findCompanyIdByName("ssg");
//        List<Order> orderList=orderDao.findAllByCompanyId(num);
//        for (Order order : orderList) {
//            System.out.println(order.toString()); // 또는 원하는 형식으로 주문 정보 출력
//        }
    }
}
