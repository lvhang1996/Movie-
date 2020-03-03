<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>电影网注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        .login_left{
            position: absolute;
            top: 150px;
            width: 30%;
            left: 20%;
            height: 600px;
        }
        .login_right{
            position: absolute;
            top: 150px;
            width: 40%;
            right: 8%;
            height: 550px;
        }
        .wei{
            right: 40%;
            text-align: center;
            position: absolute;
            bottom: 20px;
        }
        </style>
  </head>
  
  <body>
    <div class="login_left">
        <h2 class="modal-title">欢迎加入电影网</h2>
        <br/><br/>
        <form action="visitorRegister" method="post" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="username"
                           placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" name="password"
                           placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="nickname"
                           placeholder="请输入昵称">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="ipone"
                           placeholder="请输入手机号">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="email"
                           placeholder="请输入邮箱">
                </div>
            </div>
            <br>
            <span style="color :red"><s:actionerror/></span>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">注册</button>
                </div>
            </div>
        </form>
        <hr>
        <br>
        <a href="index.jsp">>>返回到主页</a>
    </div>
    <div class="login_right">
        <p>>已经拥有了账号，<a href="login.jsp">直接登录</a></p>
        <a type="button" class="btn" data-toggle="modal" data-target="#erwei">> 点击下载电影网移动应用</a>
        <br/>
        <img src="images/qingxin.jpg" alt="" width="500px" height="200px"/>
    </div>

    <div class="wei">
        <hr/>
        <img src="images/bottom.png" alt=""/>
        <p>网站建立者：吕航</p>
        <p>合作邮箱：9999@qq.com</p>
    </div>

    <div class="modal fade" id="erwei" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="left: 10%;top: 10%">
            <div class="modal-content" style="width: 300px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <img src="images/erwei.png" alt=""/>
                    <p style="color: #555555">扫描下载电影网移动应用</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
