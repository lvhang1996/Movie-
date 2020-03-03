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
    
    <title>My JSP 'findActor.jsp' starting page</title>
    
   	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" /><!--分页 -->
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />

  </head>
  
  <body>
  	<a href="lookActor.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
     <table align="center" width="80%" border="1px" id="table" >
    	<tr>
          		<th>演员</th>
          		<th>图片</th>
          		<th>国家</th>
          		<th>性别</th>
          		<th>出生日期</th>
    	</tr>
        <s:iterator value="#session.actorVaguePage.list">
		<tr>
			<td><s:property value="name"/></td>
     		<td align="center" >
				<img src="<s:property value="picture"/>" width="60" height="90">
     		</td>
     		<td><s:property value="country"/></td>
     		<td><s:property value="sex"/></td>
     		<td><s:property value="birth"/></td>
    		<td align="center" >
    				<a href="findOneActorId.action?id=<s:property value="id"/>" 
    				class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    		</td>
 			<td align="center" >
 					<a href="deleteActor.jsp?deleteid=<s:property value="id"/>" 
 					class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
 			</td>
    	</tr>
   		</s:iterator>
    	</table>
    	<div class="pagination">
       			<s:if test="#session.actorVaguePage.pageNum-1 >= 1">
					<a href="findActorName.action?pageNum=${session.actorVaguePage.pageNum-1 }" class="page"><span>上一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>上一页</span></a>
				</s:else>
      			<s:iterator begin="1" end="#session.actorVaguePage.pageNum-1" var="i">
      					<a href="findActorName.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>
      					<a class="page active"><span>${session.actorVaguePage.pageNum}</span></a>
      			<s:iterator begin="#session.actorVaguePage.pageNum+1" end="#session.totalPage" var="i">
      					<a href="findActorName.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>

      				<s:if test="#session.actorVaguePage.pageNum+1 <= #session.totalPage">
					<a href="findActorName.action?pageNum=${session.actorVaguePage.pageNum+1 }" class="page"><span>下一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>下一页</span></a>
				</s:else>
         </div>	   
    	
  </body>
</html>
