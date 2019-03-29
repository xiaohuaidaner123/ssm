package service.impl;

import mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Menu;
import pojo.Role;
import service.MenuService;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List selectMenu(String roleId) {
        return menuMapper.getMenu(roleId);
    }

    @Override
    public List getPermissions() {
        return menuMapper.getChildMenu();
    }

    @Override
    public List<Role> selectRole() {
        return menuMapper.selectRole();
    }

    @Override
    public int updatePermission(Menu menu) {
        return menuMapper.updateMenu(menu);
    }
}
