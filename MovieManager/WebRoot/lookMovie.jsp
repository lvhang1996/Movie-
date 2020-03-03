<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page import="model.Movie"%>
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
  		<s:form action="findMoviename" method="post">
	        <s:textfield name="moviename" label="电影名" maxLength="12"/>
	        <s:submit value="搜索" class="easyui-linkbutton" data-options="iconCls:'icon-search'"/>
		</s:form>
       <table id="table" align="center" width="50%" border="1px" >
    	<tr>
          		<th colspan="5" >电影列表</th>
    	</tr>
        <s:iterator value="#session.moviePage.list">
        <%-- <s:iterator value="#session.allMovieList">  --%>
		<tr>
     		<td align="center" ><s:property value="moviename"/></td>
     		<td align="center" >
    				<a href="findOneMovieMessage.action?id=<s:property value="id"/>" 
    				class="easyui-linkbutton" data-options="iconCls:'icon-search'">查看信息</a>
    		</td>
    		<td align="center" >
    				<a href="findMovieActor.action?moviename=<s:property value="moviename"/>" 
    				class="easyui-linkbutton" data-options="iconCls:'icon-print'">演员表</a>
    		</td>
    		<td align="center" >
    				<a href="findOneMovie.action?id=<s:property value="id"/>" 
    				class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    		</td>
 			<td align="center" >
 					<a href="deleteMovie.jsp?deleteid=<s:property value="id"/>&deletemovie=<s:property value="moviename"/>" 
 					class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
 			</td>
    	</tr>
   		</s:iterator>
    	</table>
    	 <div class="pagination">
       			<s:if test="#session.moviePage.pageNum-1 >= 1">
					<a href="lookMovie.action?pageNum=${session.moviePage.pageNum-1 }" class="page"><span>上一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>上一页</span></a>
				</s:else>
      			<s:iterator begin="1" end="#session.moviePage.pageNum-1" var="i">
      					<a href="lookMovie.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>
      					<a class="page active"><span>${session.moviePage.pageNum}</span></a>
      			<s:iterator begin="#session.moviePage.pageNum+1" end="#session.totalPage" var="i">
      					<a href="lookMovie.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>

      				<s:if test="#session.moviePage.pageNum+1 <= #session.totalPage">
					<a href="lookMovie.action?pageNum=${session.moviePage.pageNum+1 }" class="page"><span>下一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>下一页</span></a>
				</s:else>
         </div>	   
    	
  </body>
</html>
