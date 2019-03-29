package service;

import pojo.Role;

import java.util.List;

public interface RoleService {
    List<Role> selectRole();
    int updatePermission(String roleId, String permissions);

    List<String> getPermissionsByRoleId(String roleId);
}
