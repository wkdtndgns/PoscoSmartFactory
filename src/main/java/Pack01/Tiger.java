package Pack01;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Tiger {

  @RequestMapping("/t1")
  public String func01() {
    System.out.println("func01 call");
    return "TigerView"; // View 갈려고 시도합니다.
  }


  @RequestMapping("/t2")
  public String func02() {
    System.out.println("func02 call");
    return "TigerView"; // View 갈려고 시도합니다.
  }


  @RequestMapping("/t3")
  public String func03(
      @RequestParam(value = "name") String name
  ) {
    System.out.println(name);

    System.out.println("func03 call");
    return "TigerView"; // View
  }


  @RequestMapping("/t4")
  public String func04(
      @RequestParam(value = "age") Integer age,
      @RequestParam(value = "name") String name
  ) {
    System.out.println(name + " : " + age);
    System.out.println("func04 call");
    return "TigerView"; // View
  }


  @RequestMapping("/t5")
  public String func05(
      HttpServletRequest request
  ) {
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    System.out.println(name + " : " + age);
    System.out.println("func05 call");
    return "TigerView"; // View
  }


  @RequestMapping("/t6")
  public String func06(Model model) {
    System.out.println("func06 call");
    model.addAttribute("name", "tiger");
    model.addAttribute("age", 50);
    return "TigerView"; // View
  }


  @RequestMapping("/t7")
  public String func07(
      Model model,
      @RequestParam(value = "age") String age,
      @RequestParam(value = "name") String name
  ) {
    System.out.println(name + " : " + age);
    System.out.println("func07 call");
    model.addAttribute("name", name);
    model.addAttribute("age", age);
    return "TigerView"; // View
  }


  @RequestMapping("/t8")
  public ModelAndView func08() {
    System.out.println("func08 call");
    ModelAndView mav = new ModelAndView("TigerView");
    mav.addObject("name", "tiger");
    mav.addObject("age", 50);
    return mav;
  }

  @RequestMapping("/t9")
  public ModelAndView func09(
      @RequestParam(value = "select") Boolean select
  ) {
    System.out.println("func09 call");
    ModelAndView mav = new ModelAndView(select ? "TigerView" : "LionView");
    mav.addObject("name", "독수리");
    mav.addObject("age", 90);
    return mav;
  }

  @RequestMapping("/t11")
  public String func11(Person person) { // person객체를 커맨드 객체 (Bean 객체)
    System.out.println("func11 call");
    System.out.println(person.getId() + " : " + person.getPw());
    return "DogView";
  }
}
//
//class Person {
//
//  String id;
//  Integer pw;
//
//  Person() {
//  }
//
//  public Person(String id, Integer pw) {
//    this.id = id;
//    this.pw = pw;
//  }
//
//  public String getId() {
//    return id;
//  }
//
//  public void setId(String id) {
//    this.id = id;
//  }
//
//  public Integer getPw() {
//    return pw;
//  }
//
//  public void setPw(Integer pw) {
//    this.pw = pw;
//  }
//}