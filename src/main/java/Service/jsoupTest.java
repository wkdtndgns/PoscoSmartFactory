package Service;
import Dao.FactoryDao;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
public class jsoupTest {
    public static void main(String argsr[]){
        FactoryDao factoryDao= new FactoryDao();

        factoryDao.updateProductionByIdAndTemp(1,1,30);


    }
}
