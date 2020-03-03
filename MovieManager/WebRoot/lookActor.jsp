<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page import="model.Actor"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookActor.jsp' starting page</title>
    
   	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" /><!--分页 -->
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
    
  </head>
  
  <body>
   		<s:form action="findActorName" method="post">
	        <s:textfield name="name" label="演员名" maxLength="8"/>
	        <s:submit value="搜索" class="easyui-linkbutton" data-options="iconCls:'icon-search'"/>
		</s:form>
       <table id="table" align="center" width="80%" border="1px" >
    	<tr>
          		<th>演员</th>
          		<th>图片</th>
          		<th>国家</th>
          		<th>性别</th>
          		<th>出生日期</th>
    	</tr>
        <s:iterator value="#session.actorPage.list">
		<tr>
			<td><s:property value="name"/></td>
     		<td align="center" >
				<img src="http://localhost:8080/MovieWeb/image/actorImage/<s:property value="picture"/>" width="60" height="80">
     		</td>
     		<td><s:property value="country"/></td>
     		<td><s:property value="sex"/></td>
     		<td><s:property value="birth"/></td>
    		<td align="center" >
    				<a href="findOneActorId.action?id=<s:property value="id"/>" 
    				class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    		</td>
 			<td align="center" >
 					<a href="deleteActor.jsp?deleteAid=<s:property value="id"/>&deleteAname=<s:property value="name"/>" 
 					class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
 			</td>
    	</tr>
   		</s:iterator>
    	</table>
    	<div class="pagination">
       			<s:if test="#session.actorPage.pageNum-1 >= 1">
					<a href="lookActor.action?pageNum=${session.actorPage.pageNum-1 }" class="page"><span>上一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>上一页</span></a>
				</s:else>
      			<s:iterator begin="1" end="#session.actorPage.pageNum-1" var="i">
      					<a href="lookActor.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>
      					<a class="page active"><span>${session.actorPage.pageNum}</span></a>
      			<s:iterator begin="#session.actorPage.pageNum+1" end="#session.totalPage" var="i">
      					<a href="lookActor.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>

      			<s:if test="#session.actorPage.pageNum+1 <= #session.totalPage">
					<a href="lookActor.action?pageNum=${session.actorPage.pageNum+1 }" class="page"><span>下一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>下一页</span></a>
				</s:else>
         </div>	   
  </body>
</html>
