package Controller.User;

import Dao.User;
//import Service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
        // 로그인 관련 로직 수행
        // ...

        ModelAndView mv = new ModelAndView("User/ComRegister");
        return mv; // View로 이동합니다.
    }
}