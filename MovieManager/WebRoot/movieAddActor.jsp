<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
	    <script type="text/javascript">
        $(function(){
             $("#addActor").dialog({
                 title:"演员饰演角色",
                 width:600,
                 height:400,
                 modal:true  //模态对话框（背景不可操作）
             });
        });

    </script>
    <%
 	 request.setCharacterEncoding("utf-8");
   	%>
  </head>
  
  <body>
  	<div id="addActor"> 
     	<s:form action="addMovieActor" method="post">
            <table align="center" width="50%" border="1px" id="table">
                <tr> 
                	<td>电影</td>
                	<td>
                		<input name="moviename" value=<s:property value="#session.mn"/> />
                	</td>
                	
                	<s:textfield name="role" label="电影人物" maxLength="16"/>
                
                    <s:textfield name="actor" label="表演演员" maxLength="16"/>
                </tr>
                <tr><td colspan="2"><s:actionerror/></td></tr>
                <tr>
                	<s:submit value="提交" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"/>
	                <s:reset value="清除" class="easyui-linkbutton" data-options="iconCls:'icon-redo'"/>
                </tr>
            </table>
        </s:form>
        <a href="findMovieActor.action?moviename=<s:property value="#session.mn"/>" class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a>
     </div>
  </body>
</html>
