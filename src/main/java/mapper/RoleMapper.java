package mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.Role;

import java.util.List;

public interface RoleMapper {

    @Select("select * from sys_role")
    List<Role> selectRole();

    @Update("UPDATE sys_role_menu SET menu_id = #{menuId} WHERE role_id=#{roleId} ")
    int updatePermissionWithRoleId(@Param("roleId") String roldId, @Param("menuId") String menu_id);

    @Select("select menu_id from sys_role_menu where role_id=#{roleId}")
    List<String> selectPermissionsByRoleId(String roleId);
}
