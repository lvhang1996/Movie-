<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page import="model.Ma"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteMovie.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    
    <script type="text/javascript">
        $(function(){
             $("#deleteDialog").dialog({
                 title:"删除演员表信息",
                 width:300,
                 height:150,
                 modal:true  //模态对话框（背景不可操作）
             });
        });

    </script>

  </head>
  
  <body>
    <div id="deleteDialog"  style="display:none">
	    <p style="font-size: 20px" align="center">是否要删除该演员表信息</p>
	    <a id="deleteBtn" style="font-size: 15px"  href="deleteMovieActor.action?id=<%=request.getParameter("deleteid")%>&moviename=<%=request.getParameter("deletemovie")%>"
	    	 class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认</a>
	    <a style="font-size: 15px" href="findMovieActor.action?moviename=<%=request.getParameter("deletemovie")%>" 
	     class="easyui-linkbutton" data-options="iconCls:'icon-no'">取消</a>
	</div>
  </body>
</html>
