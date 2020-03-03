<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page import="model.Mc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
  <head>
    <base href="<%=basePath%>">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
	
   	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" /><!--分页 -->
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />

  </head>
  
  <body>
  	<br><br>
			<a href="lookMovieC.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
			<br>
	       <table id="table" align="center" width="80%" border="1px" >
	    	<tr>
	          		<th colspan="6" >评论列表</th>
	    	</tr>
	    	<tr>
	          		<th>电影名</th>
	          		<th>评论用户</th>
	          		<th>评论日期</th>
	          		<th>评论内容</th>
	          		<th>操作</th>
	    	</tr>
	        <s:iterator value="#session.movieCommentPage.list">
				<tr>
		     		<td align="center" ><s:property value="moviename"/></td>
		     		<td align="center" ><s:property value="nickname"/></td>
		     		<td align="center" ><s:property value="date"/></td>
		     		<td align="center" ><s:property value="comment"/></td>
		     		<td><a class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
href="deleteComment.jsp?cid=<s:property value="id"/>&cmoviename=<s:property value="moviename"/>&cscore=<s:property value="score"/>&cnickname=<s:property value="nickname"/>&cdate=<s:property value="date"/>&ccomment=<s:property value="comment"/>" >删除评论</a></td>
		    	</tr>
	   		</s:iterator>
	    	</table> 
    	
  </body>
</html>
