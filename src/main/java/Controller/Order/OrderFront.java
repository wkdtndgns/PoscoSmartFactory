package Controller.Order;

import Dao.Order;
import Service.OrderService;

import java.io.IOException;
import Service.ProductionService;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
@Controller
@RequestMapping("order")
public class OrderFront {

  private final OrderService orderService;

  public OrderFront() {
    orderService = new OrderService();
  }

  @RequestMapping("/list")
  public ModelAndView list(Optional<String> status) {
    ModelAndView mv = new ModelAndView("Order/list");
    List<Order> orders = orderService.getList(status.orElse(""));
    mv.addObject("orders", orders);
    mv.addObject("status", status.orElse(""));
    return mv;
  }
  @RequestMapping("/cathodorder")
  public ModelAndView cathodorder() throws IOException {

//양극재
    Document doc = Jsoup.connect("https://ko.tradingeconomics.com/commodity/lithium").get();
    Elements tdElements = doc.select("td#p");
    Element tdElement = tdElements.get(5);
    String text = tdElement.text();
    text = text.replace(",", "").trim();
    double cathoprice = Double.parseDouble(text);
    System.out.println(cathoprice);
//음극재
    String newurl = "https://kr.investing.com/equities/shanghai-putailai-new-energy-commentary";
    Document newdoc = Jsoup.connect(newurl).get();
    Element priceElement = newdoc.selectFirst("span[data-test='instrument-price-last']");
    String anodeprice = priceElement.text();
    System.out.println("가격: " + anodeprice);
    double anovalue = Double.parseDouble(anodeprice);



    String exurl = "https://finance.naver.com/marketindex/?tabSel=exchange#tab_section";
    Document exdoc = Jsoup.connect(exurl).get();
    Element valueElement = exdoc.selectFirst("span.value");
    String exchangeRate = valueElement.text();
    exchangeRate = exchangeRate.replace(",", "");
    double rate = Double.parseDouble(exchangeRate);
    System.out.println(rate+ "환율 체크" );
    anovalue= anovalue*rate;

    ModelAndView mv = new ModelAndView("Order/cathodorder");
    mv.addObject("anodeprice", anovalue);
    mv.addObject("cathoprice", cathoprice);
    mv.addObject("rate", rate);
    return mv;
  }
  @RequestMapping("/anodeorder")
  public ModelAndView anodeorder() throws IOException {

//양극재
    Document doc = Jsoup.connect("https://ko.tradingeconomics.com/commodity/lithium").get();
    Elements tdElements = doc.select("td#p");
    Element tdElement = tdElements.get(5);
    String text = tdElement.text();
    text = text.replace(",", "").trim();
    double cathoprice = Double.parseDouble(text);
    System.out.println(cathoprice);
//음극재
    String newurl = "https://kr.investing.com/equities/shanghai-putailai-new-energy-commentary";
    Document newdoc = Jsoup.connect(newurl).get();
    Element priceElement = newdoc.selectFirst("span[data-test='instrument-price-last']");
    String anodeprice = priceElement.text();
    System.out.println("가격: " + anodeprice);
    double anovalue = Double.parseDouble(anodeprice);



    String exurl = "https://finance.naver.com/marketindex/?tabSel=exchange#tab_section";
    Document exdoc = Jsoup.connect(exurl).get();
    Element valueElement = exdoc.selectFirst("span.value");
    String exchangeRate = valueElement.text();
    exchangeRate = exchangeRate.replace(",", "");
    double rate = Double.parseDouble(exchangeRate);
    anovalue= anovalue*rate;


    ModelAndView mv = new ModelAndView("Order/anodeorder");
    mv.addObject("anodeprice", anovalue);
    mv.addObject("cathoprice", cathoprice);
    mv.addObject("rate", rate);
    return mv;
  }
}
