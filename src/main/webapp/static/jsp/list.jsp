<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="easyuisupport.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<body>

    <table id="magazineGrid" class="easyui-datagrid"  style="width:auto;height:450px"
           data-options="
           rownumbers:true,
           singleSelect:false,
           url:'/borrowBooks/list.do',
           method:'get',
           toolbar:toolbar,
           autoRowHeight:false,
			 pagination:true,
            pageSize: 10,
            pageList: [10,20,30,50,100]
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

    <div id="w" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">
        The window content.
    </div>
<script type="text/javascript">
    $(function(){

        $('#magazineGrid').datagrid({
            loadMsg:'loading......'
        });
        $('#magazineGrid').datagrid('getPager').pagination({
            displayMsg:'当前显示第 {from}-{to}条记录 ， 共 {total} 条记录',
            beforePageText:'当前页',
            afterPageText:'共 {pages}页'
        });
    });


    var toolbar = [{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){
        $('#w').dialog(
            { title: '新增',
                closed: false,
                cache: false,
                href: 'addBorrowBooks.jsp',
                modal: true});
        }
    },{
    text:'修改',
    iconCls:'icon-edit',
    handler:function(){alert('cut')}
    },{
    text:'保存',
    iconCls:'icon-save',
    handler:function(){alert('save')}
    }];

</script>
</body>
</html>
