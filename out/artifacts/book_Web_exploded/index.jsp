<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../jquery-ui-master/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="../jquery-ui-master/themes/base/jquery.ui.menu.css">
    <script src="../jquery-ui-master/jquery-1.10.2.js"></script>
    <script src="../jquery-ui-master/ui/jquery.ui.core.js"></script>
    <script src="../jquery-ui-master/ui/jquery.ui.widget.js"></script>
    <script src="../jquery-ui-master/ui/jquery.ui.position.js"></script>
    <script src="../jquery-ui-master/ui/jquery.ui.menu.js"></script>
    <title>Full Layout - jQuery EasyUI Demo</title>

    <style>

        .ui-menu {
            width: 150px;
        }

    </style>
</head>
<body>
<input type="button" value="点我"/>
<input type="text" style="height:100px;width:90%" id="input" value="${time}${message}"/>

<ul id="menu">

    <li><span class="ui-icon ui-icon-disk"></span>保存</li>

    <li><span class="ui-icon ui-icon-zoomin"></span>放大</li>

    <li><span class="ui-icon ui-icon-zoomout"></span>缩小</li>

    <li class="ui-state-disabled"><span class="ui-icon ui-icon-print"></span>打印</li>

    <li>

        重置

        <ul>

            <li><span class="ui-icon ui-icon-seek-start"></span>上一个</li>

            <li><span class="ui-icon ui-icon-stop"></span>停止</li>

            <li><span class="ui-icon ui-icon-play"></span>播放</li>

            <li><span class="ui-icon ui-icon-seek-end"></span>下一个</li>

        </ul>

    </li>

    <li>了解更多关于这个菜单</li>

</ul>

</body>

<script type="application/javascript">

    $(function () {

        $("#menu").menu();

    });

</script>
</html>