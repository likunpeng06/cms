<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>欢迎</title>
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="keywords" content="" />
        <meta http-equiv="description" content="" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${ctx}/css/main.css">
        <script src="${ctx}/js/jquery-1.11.1.min.js"></script>
        <script src="${ctx}/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">后台管理系统</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="login-box text-center">
                <div class="login-single-panel-header">
                    <h3>用户密码修改</h3>
                </div>
                <div class="login-single-panel-header">
                    <h5 style="color:red">${errorMessage}</h5>
                </div>
                <div class="">
                    <legend class=""></legend>
                </div>
                <form class="form-horizontal" action="${ctx}/user/password/update" method="post">
                    <input type="hidden" name="id" value="${userForm.id}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">旧密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="password" autofocus="" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">新密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="newPassword" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">确认密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="conPassword" required="">
                        </div>
                    </div>
                    <div class="">
                        <legend class=""></legend>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-9">
                            <button type="submit" class="btn btn-primary btn-lg">提交</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="text-center">
                <a class="btn btn-primary btn-sm" href="${ctx}${forwardUrl}">返回列表</a>
            </div>
        </div>
    </body>
</html>