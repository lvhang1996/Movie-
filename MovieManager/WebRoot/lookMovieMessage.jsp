<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'updateMovie.jsp' starting page</title>
   <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    
    <script type="text/javascript">

        $(function(){
             $("#message").dialog({
                 title:"电影信息",
                 width:800,
                 height:600,
                 modal:true  //模态对话框（背景不可操作）
             });
        });
     </script>

  </head>
  
  <body>
    	<div id="message">
	        <table>
	        	<s:iterator value="#session.oneMovieList">
	            <tr>
	                <td>
	                    <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" width="100" height="120">
	                </td>
	            </tr>
	            <tr>
	                <td>电影名</td>
	                <td><s:property value="moviename"/></td>
	            </tr>
	            <tr>
	                <td>导演</td>
	                <td><s:property value="author"/></td>
	            </tr>
	            <tr>
	                <td>类型</td>
	                <td><s:property value="type"/></td>
	            </tr>
	            <tr>
	                <td>制片国家</td>
	                <td><s:property value="area"/></td>
	            </tr>
	            <tr>
	                <td>语言</td>
	                <td><s:property value="language"/></td>
	            </tr>
	            <tr>
	                <td>上映日期</td>
	                <td><s:property value="date"/></td>
	            </tr>
	            <tr>
	                <td>片长</td>
	                <td><s:property value="time"/></td>
	            </tr>
	            <tr>
	                <td>剧情简介</td>
					<td><s:property value="introduction"/></td>	            
				</tr>
			</s:iterator>     
	       </table>
	       
	    <a href="lookMovie.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a>
	</div>
  </body>
</html>
