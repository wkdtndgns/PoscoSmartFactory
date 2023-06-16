package Service;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
public class jsoupTest {
    public static void main(String argsr[]){
        try {
            /*  음극재
            String url = "https://kr.investing.com/equities/shanghai-putailai-new-energy-commentary";
            System.out.println("123");
            // HTML 문서 가져오기
            Document doc = Jsoup.connect(url).get();

            // 가격 요소 선택
            Element priceElement = doc.selectFirst("span[data-test='instrument-price-last']");

            // 가격 추출
            String price = priceElement.text();

            System.out.println("가격: " + price);
*/
            //양극재
            Document doc = Jsoup.connect("https://ko.tradingeconomics.com/commodity/lithium").get();

            // 원하는 태그 선택
            Elements tdElements = doc.select("td#p");

            // 6번째 해당하는 태그 선택
            Element tdElement = tdElements.get(5);

            // 태그 내의 텍스트 추출
            String text = tdElement.text();

            // 숫자 형식 변환
            text = text.replace(",", "").trim();
            double price = Double.parseDouble(text);

            // 결과 출력
            System.out.println(price);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
