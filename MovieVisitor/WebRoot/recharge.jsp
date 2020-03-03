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
    
    <title>充值中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            padding: 100px;
        }
        .card{
            position: absolute;
            top: 200px;
            width: 60%;
            left: 20%;

        }
    </style>
</head>
<body>
	<a class="btn btn-success btn-lg" style="font-size: 20px" 
	 href="qianbao.action?nickname=<s:property value="#session.vNickname"/>"> << 返回到我的钱包  </a>
	<div class="card">
	    <s:form action="recharge" method="post">
           <div style="position:absolute;width: 20%;left: 20%">
           	   <input type="hidden" name="nickname" value="<s:property value="#session.vNickname"/>"/>
           	   <input type="hidden" name="sheng" value="<s:property value="#session.vMoney"/>"/>
               <input type="text" size="15" class="form-control" name="cardnumber" placeholder="*银行卡号">
               <br/>
               <input type="password" size="15" class="form-control" name="cardpassword" placeholder="*银行卡密码">
               <br/>
               <input type="text" size="15" class="form-control" name="money" placeholder="*充值金额">
               <br/>
               <span style="color :red"><s:actionerror/></span>
           </div>
           <div style="position: absolute;top: 200px;left: 30%">
           		<button type="submit" class="btn btn-success btn-lg">确认</button>
           </div>
	    </s:form>
	    <div style="position: absolute;right: 10%">
	        <img src="images/bank.png" alt=""/>
	    </div>
	</div>
  </body>
</html>
