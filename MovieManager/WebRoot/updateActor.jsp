<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page import="model.Actor"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateActor.jsp' starting page</title>
    
	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    
    <script type="text/javascript">

        $(function(){
             $("#updateDialog").dialog({
                 title:"修改电影信息",
                 width:600,
                 height:400,
                 modal:true  //模态对话框（背景不可操作）
             });
        });
     </script>

  </head>
  
  <body>
	<div id="updateDialog" ><!--更改窗口  -->
	    <s:form action="updateActor" method="post" enctype="multipart/form-data">
	        <table>
	        	<s:iterator value="#session.oneActorList" id="a">
	           	<s:hidden name="id" value="%{#a.id}"/>
	           	<s:hidden name="picture" value="%{#a.picture}"/>
	            <tr>
	                <td>
	                    <img src="http://localhost:8080/MovieWeb/image/actorImage/<s:property value="picture"/>" width="100" height="120">
	                </td>
	                <td>
	                   	 更改演员图片
	                    <s:file name="upload" label="上传图片"/>
	                </td>
	            </tr>
	            <tr>
	                <td>演员</td>
	                <td><input name="name" width="20px" class="easyui-textbox" value="<s:property value="name"/>"/></td>
	            </tr>
	            <tr>
	                <td>国家</td>
	                <td><input name="country" width="20px" class="easyui-textbox" value="<s:property value="country"/>"/></td>
	            </tr>
	            <tr>
	                <td>性别</td>
	                <td><input name="sex" width="20px" class="easyui-textbox" value="<s:property value="sex"/>"/></td>
	            </tr>
	            <tr>
	                <td>出生日期</td>
	                <td><input name="birth" class="easyui-textbox" value="<s:property value="birth"/>"/></td>
	            </tr>
			</s:iterator>
			<tr><td colspan="2"><s:actionerror/></td></tr>
	        <s:submit value="提交" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"/>       
	        </table>
	    </s:form>
	    <a href="lookActor.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a>
	</div>
  </body>
</html>
