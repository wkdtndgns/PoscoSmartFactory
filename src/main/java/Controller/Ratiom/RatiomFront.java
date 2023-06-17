package Controller.Ratiom;

import Dao.Ratiom;
import Service.RatiomService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Controller
@RequestMapping("RatioM")
public class RatiomFront {

    private final RatiomService ratiomService;
    public RatiomFront(){
        ratiomService = new RatiomService();
    }

    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("RatioM/list");
        List<Ratiom> ratioms = ratiomService.getList();

        mv.addObject("ratioms", ratioms);
        return mv; // View 갈려고 시도합니다.
    }
}
