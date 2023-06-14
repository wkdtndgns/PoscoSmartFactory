package Pack01;

import java.util.LinkedList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;

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


  @RequestMapping("/t12") // get post 둘다
  public String func12(Model model) { // person 이 가로
    System.out.println("func12 call");
    // 1. int
    int num = 10;
    model.addAttribute("num", num);
    // 2. String
    String str = "문자열";
    model.addAttribute("str", str);

    // 3. arr
    int[] a = new int[]{10, 20, 30};
    model.addAttribute("ar", a);

    Person p = new Person("tiger", 1234);
    model.addAttribute("p", p);

    LinkedList<Integer> list = new LinkedList<>();
    list.add(40);
    list.add(50);
    list.add(60);
    model.addAttribute("list", list);

    LinkedList<Person> list2 = new LinkedList<>();
    list2.add(new Person("tiger1", 1));
    list2.add(new Person("tiger2", 2));
    list2.add(new Person("tiger3", 3));
    model.addAttribute("list2", list2);

    return "DogView";
  }

//  @RequestMapping(value = "/t13",method = RequestMethod.GET)
  @GetMapping("register/t13")
  public String func13(Model model) {
    System.out.println("func13 call");
    return "TigerView";
  }

  @RequestMapping("t16")
  public String func16(Wood wood) {
    System.out.println("func16 call");
    System.out.println(wood.getItem());
    return "TigerView";
  }
}

@Controller
@RequestMapping("register")
class Lion{
  @RequestMapping("/t14")
  public String func14() {
    System.out.println("func14 call");
    return "TigerView"; // View
  }
  @RequestMapping("/t15")
  public String func15() {
    System.out.println("func15 call");
    return "TigerView"; // View
  }
}