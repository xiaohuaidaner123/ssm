<%--
  Created by IntelliJ IDEA.
  User: guard
  Date: 2019-03-28
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="scripts/boot.js" type="text/javascript"></script>
    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
            border: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    </style>
    <script type="text/javascript">

    </script>
</head>
<body>

<div class="mini-fit" style="display: flex; flex-direction: row; align-items: center;">
    <div class="mini-datagrid" id="rolegrid" style="width: 30%; height: 100%" url="role/getRole" idField="id" allowCellSelect="true"
         onselectionchanged="onRoleSelectionChanged">
        <div property="columns">
            <div type="indexcolumn"></div>
            <div field="roleName">角色</div>
        </div>
    </div>
    <div id="treegrid1" class="mini-treegrid" style="width:50%;height:100%;"
         url="permission/getPermission" showTreeIcon="true"
         treeColumn="taskname" idField="id" parentField="parentId" resultAsTree="false"
         allowResize="true" expandOnLoad="true" showCheckBox="true"
    >
        <div property="columns">
            <div type="indexcolumn"></div>
            <div name="taskname" field="text" width="160" >任务名称</div>
        </div>
    </div>
</div>
<div style="position: absolute; right: 10px;top: 10px;width: 160px;height: 80px; background-color: gray;color: white;font-size: 30px;" onclick="submit()">
    提交
</div>
<script type="text/javascript">
    function onRoleSelectionChanged(e) {
        var grid = e.sender;
        var record = grid.getSelected();
        if (record) {
            $.ajax({
                url:"role/getPermissions",
                data: {
                    roleId: record.id
                },
                success: function (data) {
                    var tree = mini.get("treegrid1");
                    tree.setValue(data);
                }
            })
        }
    }
    function submit() {
        var tree = mini.get("treegrid1")
        var value = tree.getValue()
        var roleGrid = mini.get("rolegrid")
        var rows = roleGrid.getSelecteds();
        if (rows.length > 0) {
            var row = rows[0]
            $.ajax({
                url: "role/updatePermission",
                data:{
                    roleId: row.id,
                    permissions: value
                },
                success: function (data) {
                    if (data==1) {
                        mini.alert("设置成功")
                    }
                }
            })
        } else {
            mini.alert("请选择要修改的角色")
        }
    }
    mini.parse()
    var grid = mini.get("rolegrid")
    grid.load()

</script>
</body>
</html>
