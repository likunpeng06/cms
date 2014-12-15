<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> 角色列表</title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="keywords" content="" />
    <meta http-equiv="description" content="" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/css/main.css">

    <script src="${ctx}/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        $(function(){
            //分页功能
            var options = {
                size:"large",
                bootstrapMajorVersion:3,
                currentPage:${roleForm.pageInfo.currentPage},
                totalPages:${roleForm.pageInfo.totalPages},
                numberOfPages:10,
                pageUrl: function (type, page, current) {
                    var url = "${ctx}/role/list/" + page ;
                    return url;
                },
                onPageChanged:null
            }
            $('#pageDiv').bootstrapPaginator(options);

            //回显
            $("#queryValid option").each(function() {
                if ($(this).val() == '${roleForm.queryValid}') {
                    $(this).attr("selected", "selected");
                }
            });
        })

        //定时关闭提示信息
        var successMessage = '${successMessage}';
        if (successMessage != null && successMessage != '') {
            closeSuccess();
        }
        function closeSuccess() {
            setTimeout("closeSuccessTip()",2000);
        }
        function closeSuccessTip(){
            $('#tipSuccess').click();
        }
        var errorMessage = '${errorMessage}';
        if (errorMessage != null && errorMessage != '') {
            closeError();
        }
        function closeError() {
            setTimeout("closeErrorTip()",2000);
        }
        function closeErrorTip(){
            $('#tipError').click();
        }
        //查询
        function query () {
            $("#theForm").submit();
        }
    </script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">后台管理系统</a>
        </div>
    </div>
</div>
<br /><br /><br />
<div style="width: 60%;text-align: center;margin-left: auto; margin-right: auto;">
    <div class="panel panel-default">
        <c:if test="${successMessage != null}" >
            <div class="alert alert-success fade in">
                <a class="close" data-dismiss="alert" href="#" id="tipSuccess">×</a>
                    ${successMessage}
            </div>
        </c:if>
        <c:if test="${errorMessage != null}" >
            <div class="alert alert-danger fade in">
                <a class="close" data-dismiss="alert" href="#" id="tipError">×</a>
                    ${errorMessage}
            </div>
        </c:if>
        <form class="form-inline" id="theForm" action="${ctx}/role/list/1" method="post">
            <div class="text-center">
                <table class="table table-hover table-striped">
                    <tr>
                        <td class="text-center">
                            <div class="input-group">
                                <span class="input-group-addon">角色名称：</span>
                                <input type="text" name="queryRoleName" id="queryRoleName" value="${roleForm.queryRoleName}" class="form-control" placeholder="角色名称不能为空">
                            </div>
                        </td>
                        <td class="text-center">
                            <div class="input-group col-sm-5">
                                <span class="input-group-addon ">是否有效：</span>
                                <form:select path="queryEnableDisableStatus" items="${queryEnableDisableStatus}" itemValue="value" class="form-control" itemLabel="name" name="queryValid" id="queryValid"/>
                            </div>
                            &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                            <input class="btn btn-primary" id="query" name="query" type="submit" value="查询" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <div class="panel-heading" style="text-align: left">
            <span class="input-group-btn">
                <button class="btn btn-primary" id="list" name="list" type="button" onclick="query();">角色列表</button>&nbsp;&nbsp;
                <button class="btn btn-primary" id="input" name="input" type="button" onclick="window.location.href='${ctx}/role/input';">添加角色</button>
            </span>
        </div>
        <table class="table table-hover table-striped">
            <thead>
            <tr class="success">
                <td>编码</td><td>角色名称</td><td>角色描述</td><td>是否有效</td><td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${roleList}" var="role" varStatus="status">
                <tr <c:if test="${status.count%2==0}">class="warning"</c:if>>
                    <td>${role.id}</td>
                    <td>${role.roleName}</td>
                    <td>${role.roleDesc}</td>
                    <td>${role.valid.name}</td>
                    <td>
                        <button class="btn btn-primary btn-sm" id="update" name="update" type="button" onclick="window.location.href='${ctx}/role/input/' + ${role.id};">修改</button>
                        <button class="btn btn-primary btn-sm" id="toggleValidStatus" name="toggleValidStatus" type="button" onclick="window.location.href='${ctx}/role/toggleValidStatus/'+ ${role.id};">
                            <c:choose>
                                <c:when test="${role.valid.value == 1}">
                                    禁用
                                </c:when>
                                <c:otherwise>
                                    启用
                                </c:otherwise>
                            </c:choose>
                        </button>
                        <button class="btn btn-primary btn-sm" id="queryMenu" name="queryMenu" type="button" onclick="window.location.href='${ctx}/role/queryMenu/' + ${role.id};">添加菜单</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="pagination-lg">
        <ul id='pageDiv'></ul>
    </div>
</div>
<div class="text-center bottom">
    Copyright &copy; 2007-2014 qatang.com All rights reserved.
</div>
</body>
</html>