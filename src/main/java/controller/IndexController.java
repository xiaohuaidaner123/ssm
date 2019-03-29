package controller;

import base.RetData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.MenuService;

@Controller
public class IndexController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("/request")
    @ResponseBody
    public RetData getMenu(String roleId) {
        RetData data = new RetData();
        data.setData(menuService.selectMenu(roleId));
        return data;
    }

}
