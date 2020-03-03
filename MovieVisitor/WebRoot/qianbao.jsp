<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的钱包</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            padding: 50px;
        }
        .qiaobao{
            position: absolute;
            top: 100px;
            width: 50%;
            left: 25%;
        }
    </style>

</head>

<body>
<a class="btn btn-success" href="index.jsp" style="font-size: 20px"> << 返回到主页 </a>
<div class="qiaobao">
    <h2 class="modal-title">我的钱包</h2>
    <br/>
    <h4>账户余额:¥<s:property value="#session.vMoney"/> </h4> <a class="btn-success btn-sm" href="recharge.jsp">点击充值</a>
    <br/><br/><br/>
    <table class="table table-hover">
        <tr>
            <th>交易事项</th>
            <th>电影名字</th>
            <th>电影花费</th>
            <th>花费时间</th>
            <th>单号</th>
        </tr>
        <s:iterator value="#session.moneyList">
        <tr>
            <td>观看电影</td>
            <td><s:property value="spendmovie"/></td>
            <td>¥ <s:property value="spendmoney"/></td>
            <td><s:property value="spenddate"/></td>
            <td>100860<s:property value="id"/></td>
        </tr>
        </s:iterator>
    </table>

</div>
  </body>
</html>
