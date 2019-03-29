package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.MenuService;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("/getPermission")
    @ResponseBody
    public List getPermission() {
        return  menuService.getPermissions();
    }

    @RequestMapping("/updatePermission")
    @ResponseBody
    public int updatePermission(String data) {
        System.out.println(data);
        return 0;
    }
}
