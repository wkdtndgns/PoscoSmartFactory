package Controller.Introduce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class IntroduceFront{
    @RequestMapping("introduce/list")
    public String introduce(){
        return "Introduce/list";
    }
}





