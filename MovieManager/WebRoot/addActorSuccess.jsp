<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteActor.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    
    <script type="text/javascript">
        $(function(){
             $("#dialog").dialog({
                 title:"成功",
                 width:300,
                 height:150,
                 modal:true  //模态对话框（背景不可操作）
             });
        });

    </script>

  </head>
  
  <body>
     <div id="dialog"  style="display:none">
	    <p style="font-size: 20px" align="center">添加演员信息成功</p>
	    <a style="font-size: 15px" class="easyui-linkbutton" href="addActor.jsp" data-options="iconCls:'icon-reback'">继续添加</a>
	</div>
  </body>
</html>
