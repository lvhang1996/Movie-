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
    
    <title>电影网登录</title>
    
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
        <h2 class="modal-title">登录电影网</h2>
        <br/><br/>
        <form action="visitorLoginS" method="post">
            <div class="form-group">
                <p class="control-label">用户名</p>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="username"
                           placeholder="请输入用户名">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <p class="control-label">密    码</p>
                <div class="col-sm-6">
                    <input type="password" class="form-control" name="password"
                           placeholder="请输入密码">
                </div>
            </div>
            <div style="padding-left: 60px ;padding-top: 50px">
                <br/>
                <span style="color :red"><s:actionerror/></span>
  				<input type="hidden" name="moviename" value="<%=request.getParameter("mname")%>"/>
            	<input type="hidden" name="id" value="<%=request.getParameter("mid")%>"/>
                <button type="submit" class="btn btn-success">登录</button>
            </div>
        </form>
        <div>
            <br/>
            <img src="images/three.png" alt=""/>
            <br/>
            <a href="index.jsp">>>返回到主页</a>
        </div>
    </div>
    <div class="login_right">
        <p>>还没有账号？<a href="register.jsp">立即注册</a></p>
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
