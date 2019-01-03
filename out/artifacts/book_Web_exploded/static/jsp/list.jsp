<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="easyuisupport.jsp" %>
<html>
<head>
    <title>查詢</title>
</head>
<body>

<div id="magazineGrid">
    <table class="easyui-datagrid" title="信息結果" style="width:auto;height:400px"
           data-options="rownumbers:true,
           singleSelect:false,
           url:'/borrowBooks/list.do',
           method:'get',
           toolbar:toolbar,
           autoRowHeight:false,
			 pagination:true,
			 pageSize:10
            ">
        <thead>
        <tr>
            <th data-options="field:'id',checkbox: true"></th>
            <th data-options="field: 'borrower',resizable:false" width="15%">借书人名称</th>
            <th data-options="field: 'tel',resizable:false" width="15%">借书人联系方式</th>
            <th data-options="field: 'bookName', resizable:false" width="15%">书名</th>
            <th data-options="field: 'num',resizable:false" width="8%">借阅数量</th>
            <th data-options="field: 'createTime', resizable:false" width="15%">创建时间</th>
            <th data-options="field: 'startTime',resizable:false" width="15%">借书时间</th>
            <th data-options="field: 'endTime', resizable:false" width="15%">预计还书时间</th>
        </tr>
        </thead>
    </table>
</div>
</body>

<script type="text/javascript">
    var toolbar = [{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){alert('add')}
    },{
    text:'修改',
    iconCls:'icon-edit',
    handler:function(){alert('cut')}
    },{
    text:'保存',
    iconCls:'icon-save',
    handler:function(){alert('save')}
    }];


<%--$('#magazineGrid').datagrid({--%>
        <%--toolbar:[{--%>
            <%--text:'新增',--%>
            <%--iconCls:'icon-add',--%>
            <%--handler:function(){alert('add')}--%>
        <%--},{--%>
            <%--text:'修改',--%>
            <%--iconCls:'icon-edit',--%>
            <%--handler:function(){alert('cut')}--%>
        <%--},'-',{--%>
            <%--text:'保存',--%>
            <%--iconCls:'icon-save',--%>
            <%--handler:function(){alert('save')}--%>
        <%--}],//表头工具--%>
        <%--height: 400,--%>
        <%--url: <%=request.getContextPath()%>'/borrowBooks/list.do',--%>
        <%--method: 'get',--%>
        <%--// idField: '产品ID',--%>
        <%--striped: true,--%>
        <%--fitColumns: true,--%>
        <%--singleSelect: false,--%>
        <%--rownumbers: true,--%>
        <%--pagination: true,//分页--%>
        <%--nowrap: false,--%>
        <%--pageSize: 10,--%>
        <%--pageList: [10, 20, 50, 100, 150, 200],--%>
        <%--showFooter: true,--%>
        <%--loadMsg: '数据加载中....',--%>
        <%--columns: [[--%>
            <%--{field: 'id', checkbox: true},--%>
            <%--{field: 'Borrower', title: '借书人名称', width: 50, align: 'left'},--%>
            <%--{field: 'tel', title: '借书人联系方式', width: 50, align: 'left'},--%>
            <%--{field: 'bookName', title: '书名', width: 100, align: 'left'},--%>
            <%--{field: 'num', title: '借阅数量', width: 50, align: 'left'},--%>
            <%--{field: 'createTime', title: '创建时间', width: 100, align: 'left'},--%>
            <%--{field: 'startTime', title: '借书时间', width: 100, align: 'left'},--%>
            <%--{field: 'endTime', title: '预计还书时间', width: 100, align: 'right'}--%>
        <%--]],--%>
        <%--loadFilter: pagerFilter,--%>
        <%--onBeforeLoad: function (param) {--%>
        <%--},--%>
        <%--onLoadSuccess: function (data) {--%>

        <%--},--%>
        <%--onLoadError: function () {--%>

        <%--},--%>
        <%--onClickCell: function (rowIndex, field, value) {--%>

        <%--}--%>
    <%--});--%>

    //分页功能
    function pagerFilter(data) {
        if (typeof data.length == 'number' && typeof data.splice == 'function') {
            data = {
                total: data.length,
                rows: data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage: function (pageNum, pageSize) {
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh', {
                    pageNumber: pageNum,
                    pageSize: pageSize
                });
                dg.datagrid('loadData', data);
            }
        });
        if (!data.originalRows) {
            if (data.rows)
                data.originalRows = (data.rows);
            else if (data.data && data.data.rows)
                data.originalRows = (data.data.rows);
            else
                data.originalRows = [];
        }
        var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    };
</script>
</html>
