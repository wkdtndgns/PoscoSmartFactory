package Service;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
public class jsoupTest {
    public static void main(String argsr[]){
        try {

//            String newurl = "https://kr.investing.com/equities/shanghai-putailai-new-energy-commentary";
//            Document newdoc = Jsoup.connect(newurl).get();
//            Element priceElement = newdoc.selectFirst("span[data-test='instrument-price-last']");
//            String anodeprice = priceElement.text();
//            System.out.println("가격: " + anodeprice);
//
//            //양극재
//            Document doc = Jsoup.connect("https://ko.tradingeconomics.com/commodity/lithium").get();
//
//            // 원하는 태그 선택
//            Elements tdElements = doc.select("td#p");
//
//            // 6번째 해당하는 태그 선택
//            Element tdElement = tdElements.get(5);
//
//            // 태그 내의 텍스트 추출
//            String text = tdElement.text();
//
//            // 숫자 형식 변환
//            text = text.replace(",", "").trim();
//            double price = Double.parseDouble(text);
//
//            // 결과 출력
//            System.out.println(price);
            try {
                String exurl = "https://finance.naver.com/marketindex/?tabSel=exchange#tab_section";
                Document exdoc = Jsoup.connect(exurl).get();
                Element valueElement = exdoc.selectFirst("span.value");
                String exchangeRate = valueElement.text();
                exchangeRate = exchangeRate.replace(",", "");
                double rate = Double.parseDouble(exchangeRate);

                System.out.println("환율: " + rate);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
