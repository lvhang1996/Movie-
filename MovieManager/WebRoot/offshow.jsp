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
             $("#offshowDialog").dialog({
                 title:"电影下映",
                 width:300,
                 height:200,
                 modal:true  //模态对话框（背景不可操作）
             });
        });
     </script>
    
  </head>
  
  <body>
     <div id="offshowDialog" style="font-size:18px;" >
     	<p>是否确认下映电影</p>
	    <s:form action="updateOffshowMovie" method="post">
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
	        	<s:hidden name="video" value="%{#m.video}"/>

	            <s:submit value="确认" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"/>   
			</s:iterator>    
	        </table>
	    </s:form>
	    <a href="lookOnshowMovie.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a> 
	</div>
  </body>
</html>
