package service.impl;

import mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Role;
import service.RoleService;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> selectRole() {
        return roleMapper.selectRole();
    }

    @Override
    public int updatePermission(String roleId, String permissions) {
        return roleMapper.updatePermissionWithRoleId(roleId, permissions);
    }

    @Override
    public List<String> getPermissionsByRoleId(String roleId) {
        return roleMapper.selectPermissionsByRoleId(roleId);
    }
}
