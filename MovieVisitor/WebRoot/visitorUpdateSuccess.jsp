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
    
    <title>更改成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        .visitor_update_left{
            position: absolute;
            top: 100px;
            width: 35%;
            left: 15%;
            height: 600px;
        }
        .visitor_update_right{
            position: absolute;
            top: 200px;
            width: 20%;
            right: 25%;
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
<div class="visitor_update_left">
    <h3>更新成功，<a href="findUpdateVisitor.action?id=<s:property value="#session.vId"/>">返回账号管理</a></h3>
    <br/><br/><br/><br/><br/>
    <a href="index.jsp">>>返回到主页</a>
</div>
<div class="visitor_update_right" style="font-size: 15px">
    <img src="images/qingxin.jpg" alt="" width="500px" height="200px"/>
</div>

<div class="wei">
    <hr/>
    <img src="images/bottom.png" alt=""/>
    <p>网站建立者：吕航</p>
    <p>合作邮箱：9999@qq.com</p>
</div>


</body>
</html>
