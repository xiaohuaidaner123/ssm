package mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.mapping.FetchType;

import pojo.Menu;
import pojo.Role;
import pojo.SysChildren;

public interface MenuMapper {

    class MenuProvider {
        public String selectMenu() {
            return new SQL() {{
                SELECT("*").FROM("sys_menu").WHERE("parent_id in ('0')");
            }}.toString();
        }

        public String updateMenu(final Menu menu) {
            return new SQL() {{
                UPDATE("sys_menu").SET("title=#{text}").WHERE("menu_id=#{menuId}");
            }}.toString();
        }
    }

    @Select("SELECT * FROM sys_menu WHERE sys_menu.parent_id='0' AND sys_menu.menu_id in (SELECT substring_index(substring_index(t.menu_id,',', b.help_topic_id + 1), ',', -1) \n" +
            "FROM anxinsu.sys_role_menu t \n" +
            "join mysql.help_topic b \n" +
            "ON b.help_topic_id <  (LENGTH(t.menu_id) - LENGTH(REPLACE(t.menu_id, ',', '')) + 1)\n" +
            "WHERE t.role_id=#{roleId})")
    @Results({
            @Result(property = "id", column = "menu_id"),
            @Result(property = "text", column = "title"),
            @Result(property = "iconCls", column = "icon_cls"),
            @Result(property = "children", column = "menu_id", javaType = List.class,
                    many = @Many(select = "mapper.MenuMapper.getChildMenuByParentId",
                            fetchType = FetchType.LAZY))
    })
    List<Menu> getMenu(String roleId);

    @Select("SELECT * FROM sys_menu WHERE sys_menu.parent_id=#{menu_id}")
    @Results(id = "childMenuMap", value = {
            @Result(property = "id", column = "menu_id"),
            @Result(property = "text", column = "title"),
            @Result(property = "url", column = "url"),
            @Result(property = "iconCls", column = "icon_cls"),
            @Result(property = "parentId", column = "parent_id")
    })
    List<SysChildren> getChildMenuByParentId(@Param("menu_id") String menu_id);

    @Select("select * from sys_menu")
    @ResultMap("childMenuMap")
    List<SysChildren> getChildMenu();

    @Select("select * from role")
    List<Role> selectRole();

    @UpdateProvider(type = MenuProvider.class, method = "updateMenu")
    int updateMenu(Menu menu);
}
