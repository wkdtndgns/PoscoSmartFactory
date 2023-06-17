package Controller.User;

import Dao.CompanyDao;
import Dao.User;
//import Service.UserService;
import Dao.UserDao;
import Service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
@Controller
@RequestMapping("User")
public class UserFront {

    //private final UserService userService;

    public UserFront() {
    //    userService = new UserService();
    }

    @RequestMapping("/Login")
    public ModelAndView Login() {
        // 로그인 관련 로직 수행
        // ...

        ModelAndView mv = new ModelAndView("User/Login");
        return mv; // View로 이동합니다.
    }

    @RequestMapping("/FacRegister")
    public ModelAndView FacRegister() {
        // 로그인 관련 로직 수행
        // ...

        ModelAndView mv = new ModelAndView("User/FacRegister");
        return mv; // View로 이동합니다.
    }
    @RequestMapping("/ComRegister")
    public ModelAndView ComRegister() {
      //로그인 페이지


        ModelAndView mv = new ModelAndView("User/ComRegister");
        return mv; // View로 이동합니다.
    }

    @PostMapping("/LoginAction")
    public ModelAndView LoginAction(@RequestParam("username") String id, @RequestParam("password") String password,  HttpSession session) {
        // 아이디와 패스워드를 이용한 로그인 처리 로직 작성

        UserDao userDao = new UserDao();
        System.out.println("아이디: " + id);
        System.out.println("패스워드: " + password);
        UserService userService = new UserService(userDao);
        boolean loginSuccess = userService.login(id, password);

        if (loginSuccess) {
            // 관리자 로그인 성공 시
            session.setAttribute("username", id);
            if(id.equals("posco") && password.equals("password")){
                ModelAndView modelAndView = new ModelAndView("redirect:/home");
                return modelAndView;
            }else {
                //기업로그인 성공
                ModelAndView modelAndView = new ModelAndView("redirect:/company/companyhome");
                return modelAndView;
            }

        }
        else {
            // 로그인 실패 시
            ModelAndView modelAndView = new ModelAndView("redirect:/User/Login");
            modelAndView.addObject("errorMessage", "로그인 정보가 올바르지 않습니다."); // 실패 메시지 추가
            return modelAndView;
        }

        // 다이렉션 설정
    }
    @RequestMapping("/ComRegisterAction")
    public ModelAndView comRegisterAction(HttpServletRequest request) {
        String companyName = request.getParameter("companyName");
        String generatedId = request.getParameter("generatedId");
        String generatedPassword = request.getParameter("generatedPassword");
        String companyLocation = request.getParameter("companyLocation");
        String companyIntro = request.getParameter("companyIntro");
        String category = request.getParameter("category");

        // 값 출력
        System.out.println("companyName: " + companyName);
        System.out.println("generatedId: " + generatedId);
        System.out.println("generatedPassword: " + generatedPassword);
        System.out.println("companyLocation: " + companyLocation);
        System.out.println("companyIntroduction: " + companyIntro);
        System.out.println("companyCategory: " + category);
        int intCategory=Integer.parseInt(category);

        // T_company 값 새로 insert하기
// user insert하기
        UserDao userDao = new UserDao();
        userDao.insertUser(generatedId,generatedPassword,companyName);
// T_company 값 새로 insert하기
        CompanyDao companyDao = new CompanyDao();
        companyDao.insertCompany(companyName,intCategory,companyIntro,companyLocation);
        ModelAndView mv = new ModelAndView("User/ComRegisterAction");
        return mv;
    }

}