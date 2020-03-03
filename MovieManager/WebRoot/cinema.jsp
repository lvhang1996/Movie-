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
    
    <title>My JSP 'cinema.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" /><!--分页 -->
	<link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
  </head>
  
  <body>
    <table id="table" align="center" width="50%" border="1px" >
	   	<tr>
       		<th>电影列表</th>
       		<th>上映时间</th>
       		<th>是否上映</th>
       		<th>影票价格</th>
       		<th>操作</th>
	   	</tr>
	    <s:iterator value="#session.moviePage.list" id="cc">
		<tr>
	    		<td align="center" ><s:property value="moviename"/></td>
	    		<td align="center" ><s:property value="date"/></td>
	    		<td align="center" ><s:property value="onshow"/></td>
	    		<td align="center" ><s:property value="price"/></td>
				<td align="center">
					<s:set name="onshowvalue" value="<s:property value='onshow'/>"/>
				
					<s:if test='#cc.onshow=="未上映"'>
					<a href="findOnshowMovie.action?id=<s:property value="id"/>" 
					   class="easyui-linkbutton" data-options="iconCls:'icon-edit'">上映</a>
					</s:if>
				 	<s:else>
			           <a href="findOffshowMovie.action?id=<s:property value="id"/>" 
			           class="easyui-linkbutton" data-options="iconCls:'icon-edit'">下映</a>
			       	</s:else>
				</td>
	
	   	</tr>
	   	 
	  	</s:iterator>
   	</table>  
 	 <div class="pagination">
       			<s:if test="#session.moviePage.pageNum-1 >= 1">
					<a href="lookOnshowMovie.action?pageNum=${session.moviePage.pageNum-1 }" class="page"><span>上一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>上一页</span></a>
				</s:else>
      			<s:iterator begin="1" end="#session.moviePage.pageNum-1" var="i">
      					<a href="lookOnshowMovie.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>
      					<a class="page active"><span>${session.moviePage.pageNum}</span></a>
      			<s:iterator begin="#session.moviePage.pageNum+1" end="#session.totalPage" var="i">
      					<a href="lookOnshowMovie.action?pageNum=${i}" class="page"><span>${i}</span></a>
      			</s:iterator>

      				<s:if test="#session.moviePage.pageNum+1 <= #session.totalPage">
					<a href="lookOnshowMovie.action?pageNum=${session.moviePage.pageNum+1 }" class="page"><span>下一页</span></a>
				</s:if>
				<s:else>
					<a class="page active"><span>下一页</span></a>
				</s:else>
         </div>	   
  </body>
</html>
