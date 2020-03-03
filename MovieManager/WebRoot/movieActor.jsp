<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page import="model.Movie"%>
<%@page import="model.Ma"%>
<%request.setCharacterEncoding("utf-8");%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>My JSP 'movieAddActor.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />


  </head>
  
  <body>
  <a href="lookMovie.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a>
   <table align="center" width="50%" border="1px" id="table">
   			<tr>
	          		<th>电影：<s:property value="#session.mn"/></th>
	          		<th><a href="movieAddActor.jsp?moviename=<s:property value="#session.mn"/>" 
	          		class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加演员</a></th>
	    	</tr>
	    	<tr>
	          		<th>电影人物</th>
	          		<th>表演演员</th>
	    	</tr>
	        <s:iterator value="#session.movieactorList">
			<tr>
	     		<td align="center" ><s:property value="role"/></td>
	     		<td align="center" ><s:property value="actor"/></td>
	     		<td align="center" >
	    				<a href="findOneMovieActor.action?id=<s:property value="id"/>&moviename=<s:property value="moviename"/>" 
	    				class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	    		</td>
	 			<td align="center" >
	 					<a href="movieDeleteActor.jsp?deleteid=<s:property value="id"/>&deletemovie=<s:property value="moviename"/>" 
	 					class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	 			</td>
	    	</tr>
	   		</s:iterator>
    	</table>
  </body>
</html>
