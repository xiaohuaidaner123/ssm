<%--
  Created by IntelliJ IDEA.
  User: guard
  Date: 2019-03-29
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限维护</title>
    <script type="text/javascript" src="scripts/boot.js"></script>
    <script src="js/ColumnsMenu.js" type="text/javascript"></script>
    <link href="res/css/common.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div class="mini-fit">
        <div id="toolbar" class="mini-toolbar" style="padding: 2px;">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 100%;">
                        <a class="mini-button" iconCls="icon-addfolder" plain="true" onclick="addPermission()">增加</a>
                        <a class="mini-button" iconCls="icon-remove" plain="true" onclick="removePermission()">删除</a>
                        <span class="separator"></span>
                        <a class="mini-button" iconCls="icon-reload" plain="true" onclick="refreshPermission()">刷新</a>
                        <a class="mini-button" iconCls="icon-download" plain="true" onclick="savePermission()">保存</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="treegrid" class="mini-treegrid" style="width: 100%; height: 100%;" url="permission/getPermission" showTreeIcon="true"
             treeColumn="name" idField="id" parentField="parentId" resultAsTree="false"
            expandOnLoad="true" allowRowSelect="true" editNextOnEnterKey="true" editNextRowCell="true" allowCellEdit="true" allowCellSelect="true">
            <div property="columns">
                <div type="indexcolumn"></div>
                <div name="name" field="text">
                    权限名称
                    <input property="editor" class="mini-textbox" style="width: 100%;" minWidth="200"/>
                </div>
                <div field="url">链接</div>
                <div field="iconCls">图标</div>
            </div>
        </div>
    </div>
<script type="text/javascript">
    mini.parse()
    var tree = mini.get("treegrid")
    function addPermission() {
        var rows = tree.getSelecteds()

    }

    function refreshPermission() {

    }
    function removePermission() {
        var rows = tree.getSelecteds()
        if (rows.length>0) {
            alert(rows)
        } else {
            mini.alert("请选择要删除的权限")
        }
    }
    function savePermission() {
        var data = tree.getChanges()
        $.ajax({
            url: 'permission/updatePermission',
            data: {
                data: mini.encode(data)
            },
            success: function (res) {
                alert(res)
            }
        })
    }
</script>
</body>
</html>
