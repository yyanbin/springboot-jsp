<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="easyuisupport.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height:100px">勇哥书店管理系统</div>
<div data-options="region:'center'">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west'"style="width:180px">
            <div class="easyui-panel" data-options="title:'功能导航',border:false,fit:true">
                <div class="easyui-accordion" data-options="fit:true,border:false">
                    <div class="easyui-accordion" data-options="fit:true,border:false">
                        <div title="系统菜单" id="menu" data-options="iconCls:'icon-large-picture'">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-options="region:'center',title:'欢迎使用系统'">
            <div id="layout_center_tabs" class="easyui-tabs" data-options="fit:true,border:false" style="overflow: hidden;">
                <div title="首页">
                        <h1 style="color: red">请点击左侧菜单办理具体业务</h1>
                </div>
            </div>

        </div>
    </div>
</div>
</body>

<script type="application/javascript">

    $('#menu').tree({
        url: 'resource/selectMenu',
        loadFilter: function(rows){
            return convert(rows);
        },
        onClick: function(node){
            var url = node.url;
            if (url) {
                var url =url;
                addTab({
                    title : node.text,
                    closable : true,
                    content: '<iframe id="iframe" scrolling="auto" frameborder="0"  src=' + url + ' style="width:100%;height:100%;"></iframe>',
                    selected: true,
                    cache: false
                    // href : url
                });
            }
        },
    });

    function addTab(opts) {
        console.log(opts);
        var t = $('#layout_center_tabs');
        if (t.tabs('exists', opts.title)) {
            t.tabs('select', opts.title);
        } else {
            t.tabs('add', opts);
        }
    }

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