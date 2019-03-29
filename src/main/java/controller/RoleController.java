package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Role;
import service.RoleService;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/getRole")
    @ResponseBody
    public List<Role> selectRole() {
        return  roleService.selectRole();
    }

    @RequestMapping("/updatePermission")
    @ResponseBody
    public int updatePermission(String roleId, String permissions) {
        return  roleService.updatePermission(roleId, permissions);
    }

    @RequestMapping("/getPermissions")
    @ResponseBody
    public String getPermission(String roleId) {
        return roleService.getPermissionsByRoleId(roleId).get(0);
    }
}
