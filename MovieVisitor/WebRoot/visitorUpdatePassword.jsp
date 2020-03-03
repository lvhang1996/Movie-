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
    
    <title>更改密码</title>
    
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
        table td{
            height: 50px;
            font-size: 20px;
        }
    </style>

</head>

<body>
<div class="visitor_update_left">
    <h3 class="modal-title">更改密码</h3>
    <br/>
    <img src="images/kuai.jpg" alt="" width="600px" height="50px"/>
    <br/>
    <s:form action="visitorUpdatePassword" method="post">
        <table>
        	<s:iterator value="#session.updateVisitorList" id="v">
                <s:hidden name="id" value="%{#v.id}"/>
                <s:hidden name="username" value="%{#v.username}"/>
                <s:hidden name="picture" value="%{#v.picture}"/>
                <s:hidden name="email" value="%{#v.email}"/>
                <s:hidden name="ipone" value="%{#v.ipone}"/>
                <s:hidden name="nickname" value="%{#v.nickname}"/>
                <s:hidden name="money" value="%{#v.money}"/>
            <tr>
                <td>用户名：</td>
                <td><s:property value="username"/></td>
            </tr>
            <tr>
				<td>新密码：</td>
                <td><input name="password" type="password" width="20px"/></td>
            </tr>
            <tr>
				<td>确认密码：</td>
                <td><input name="passwordAgain" type="password" width="20px"/></td>
            </tr>
            <!-- <tr><td><input name="id" type="hidden" value="<s:property value="#session.vId"/>"/></td></tr> -->
            <tr><td colspan="2"> <span style="color :red"><s:actionerror/></span></td></tr>
            </s:iterator>
        </table>
        <button type="submit" class="btn btn-success">更改密码</button>
    </s:form>
</div>
<div class="visitor_update_right" style="font-size: 15px">
    <br/>
    <a href="findUpdateVisitor.action?id=<s:property value="#session.vId"/>"> >>返回账号管理</a>
    <br/><br/>
    <a href="index.jsp">>>返回到主页</a>
</div>


<div class="wei">
    <hr/>
    <img src="images/bottom.png" alt=""/>
    <p>网站建立者：吕航</p>
    <p>合作邮箱：9999@qq.com</p>
</div>


</body>
</html>
