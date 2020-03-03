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
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
    
    <script type="text/javascript">

        $(function(){
             $("#onshowDialog").dialog({
                 title:"电影上映",
                 width:400,
                 height:300,
                 modal:true  //模态对话框（背景不可操作）
             });
        });
     </script>
    
  </head>
  
  <body>
     <div id="onshowDialog" >
	    <s:form action="updateOnshowMovie" method="post">
	        <table>
	        	<s:iterator value="#session.oneMovieList" id="m" >
	        	<s:hidden name="id" value="%{#m.id}"/>
	        	<s:hidden name="moviename" value="%{#m.moviename}"/>
	        	<s:hidden name="author" value="%{#m.author}"/>
	        	<s:hidden name="score" value="%{#m.score}"/>
	        	<s:hidden name="type" value="%{#m.type}"/>
	        	<s:hidden name="date" value="%{#m.date}"/>
	        	<s:hidden name="area" value="%{#m.area}"/>
	        	<s:hidden name="time" value="%{#m.time}"/>
	        	<s:hidden name="language" value="%{#m.language}"/>
	        	<s:hidden name="picture" value="%{#m.picture}"/>
	        	<s:hidden name="introduction" value="%{#m.introduction}"/>
	        	<s:hidden name="good" value="%{#m.good}"/>
	        	<s:hidden name="bad" value="%{#m.bad}"/>
	        	
	            <tr>
	                <td>电影名</td>
	                <td><s:property value="moviename"/></td>
	            </tr>
	            <tr>
	                <td>价格</td>
	                <td><input name="price" width="20px" class="easyui-textbox" /></td>
	            </tr>
	            <tr>
	                <td>上传电影路径</td>
	                <td><input type="file" name="video" /> </td>
	            </tr>
	            <s:submit value="确认" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"/>
			</s:iterator>    
	        </table>
	    </s:form>
	    <a href="lookOnshowMovie.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a> 
	</div>
  </body>
</html>
