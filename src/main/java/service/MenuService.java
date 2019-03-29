package service;

import pojo.Menu;
import pojo.Role;

import java.util.List;

public interface MenuService {
    List selectMenu(String roleId);
    List getPermissions();
    List<Role> selectRole();

    int updatePermission(Menu menu);
}
