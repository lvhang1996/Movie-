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
    
    <title>管理者登录界面</title>
	<style type="text/css">
        #font{
            font-size: 50px;
            color: black;
            position: absolute;
            top: 150px;
            left: 25%;
        }
    </style>

  </head>
  
  <body>
	  <div style="position:absolute;z-index:-1;width:100%;height:100%;">
	    <img src="images/back.jpg" width="100%" height="100%" />
	  </div>
	  <p id="font">电影信息系统管理员界面</p>
    <s:form action="managerLogin" method="post">
        <table style="font-size:30px;position:absolute; top:30%; left:70%" border="1" width="18%">
            <tr><s:textfield name="username" label="用户名" size="20"/></tr>
            
            <tr><s:password name="password" label="密   码" size="20"/></tr>
            
            <tr><td colspan="2" align="center"><s:actionerror/></td></tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" style="font-size:25px" value="确定"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" style="font-size:25px" value="清空"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <s:a href="managerRegister.jsp">新员工注册</s:a>
                </td>
            </tr>
        </table>
     </s:form>
  </body>
</html>
