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
    
    <title>My JSP 'updateMovie.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    
    <script type="text/javascript">

        $(function(){
             $("#updateDialog").dialog({
                 title:"修改演员表信息",
                 width:400,
                 height:200,
                 modal:true  //模态对话框（背景不可操作）
             });
        });
     </script>

  </head>
  
  <body>
    <div id="updateDialog" ><!--更改窗口  -->
	    <s:form action="updateMovieActor" method="post">
	        <table>
	        <s:iterator value="#session.oneMovieActorList" id="m">
	           	<s:hidden name="id" value="%{#m.id}"/>
	           	<s:hidden name="moviename" value="%{#m.moviename}"/>
	            <tr>
	                <td>电影人物</td>
	                <td><input name="role" width="20px" class="easyui-textbox" value="<s:property value="role"/>"/></td>
	            </tr>
	            <tr>
	                <td>表演演员</td>
	                <td><input name="actor" width="20px" class="easyui-textbox" value="<s:property value="actor"/>"/></td>
	            </tr>
			</s:iterator>
			<s:actionerror/>
	        <s:submit value="提交" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"/>
	        </table>
	    </s:form>
	    <a href="findMovieActor.action?moviename=<s:property value="%{#m.moviename}"/>" 
	    class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a>
	</div>
  </body>
</html>
