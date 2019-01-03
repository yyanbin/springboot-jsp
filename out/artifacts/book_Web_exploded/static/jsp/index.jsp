<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="easyuisupport.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>Full Layout - jQuery EasyUI Demo</title>

    <style>

    </style>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height:100px">勇哥书店管理系统</div>
<div data-options="region:'center'">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',title:'功能导航',split:true,collapsed:false" style="width:180px">
                <div  class="easyui-accordion" data-options="fit:fas,border:false">
                    <div title="系统菜单" id="menu" data-options="iconCls:'icon-save'">
                    </div>
                </div>
        </div>
        <div data-options="region:'center',title:'欢迎使用系统'">
            <div id="layout_center_tabs" class="easyui-tabs" data-options="fit:true,border:false" style="overflow: hidden;">
                <div title="首页">
                    <div id="welcome" style="width: 100%; height: 90%;">
                        <h1 style="color: red">请点击左侧菜单办理具体业务</h1>
                    </div>
                </div>
            </div>
            <%--<jsp:include page="center.jsp"></jsp:include>--%>
                    <%--<iframe id="pageurl" style="width: 100%; height: 100%;display:none" frameborder='0'></iframe>--%>
        </div>
    </div>
</div>
</body>

<script type="application/javascript">

    $('#menu').tree({
        url: 'resource/selectMenu',
        loadFilter: function(rows){
            console.log(rows);
            return convert(rows);
        },
        onClick: function(node){
            $('#welcome').hide();
            $("#center").panel('setTitle',node.name);
            $("#center").title=node.name;
           $('#pageurl').attr("src",node.url);
           //  $("#pageurl").load("../index.jsp");
            $('#pageurl').show();

            var url = node.url;
            if (url) {
                var url =url;
                addTab({
                    title : node.text,
                    closable : true,
                    href : url
                });
            }
        },
        error:function (e) {
            alert("获取菜单异常"+e);
        }
    });

    function exists(rows, parentId){
        for(var i=0; i<rows.length; i++){
            if (rows[i].id == parentId) return true;
        }
        return false;
    }
    function convert(rows){
        var nodes = [];
        // 获取顶级节点
        for(var i=0; i<rows.length; i++){
            var row = rows[i];
            if (!exists(rows, row.parentId)){
                nodes.push({
                    id:row.id,
                    text:row.name
                });
            }
        }

        var toDo = [];
        for(var i=0; i<nodes.length; i++){
            toDo.push(nodes[i]);
        }
        while(toDo.length){
            var node = toDo.shift();	// the parent node
            // 获取子节点
            for(var i=0; i<rows.length; i++){
                var row = rows[i];
                if (row.parentId == node.id){
                    var child = {id:row.id,text:row.name, url:row.url};
                    if (node.children){
                        node.children.push(child);
                    } else {
                        node.children = [child];
                    }
                    toDo.push(child);
                }
            }
        }
        return nodes;
    }

</script>
</html>