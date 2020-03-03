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
             $("#updateDialog").dialog({
                 title:"修改电影信息",
                 width:1000,
                 height:600,
                 modal:true  //模态对话框（背景不可操作）
             });
        });
     </script>
    
  </head>
  
  <body>
<div id="updateDialog" ><!--更改窗口  -->
	    <s:form action="updateMovie" method="post" enctype="multipart/form-data">
	        <table>
	        	<s:iterator value="#session.oneMovieList" id="m">
	           	<s:hidden name="id" value="%{#m.id}"/>
	           	<s:hidden name="moviename" value="%{#m.moviename}"/>
	           	<s:hidden name="score" value="%{#m.score}"/>
	           	<s:hidden name="price" value="%{#m.price}"/>
	           	<s:hidden name="onshow" value="%{#m.onshow}"/>
	           	<s:hidden name="good" value="%{#m.good}"/>
	           	<s:hidden name="bad" value="%{#m.bad}"/>
	           	<s:hidden name="video" value="%{#m.video}"/>
	           	<s:hidden name="picture" value="%{#m.picture}"/>
	            <tr>
	                <td>
	                   <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" width="100" height="120">
	                </td>
	                <td>
	                   	 更改电影图片
	                    <s:file name="upload" label="上传图片"/>
	                </td>
	            </tr>
	            <tr>
	                <td>电影名</td>
	                <td><s:property value="moviename"/></td>
	            </tr>
	            <tr>
	                <td>导演</td>
	                <td><input name="author" width="20px" class="easyui-textbox" value="<s:property value="author"/>"/></td>
	            </tr>
	            <tr>
	                <td>类型</td>
	                <td><input name="type" width="20px" class="easyui-textbox" value="<s:property value="type"/>"/></td>
	            </tr>
	            <tr>
	                <td>制片国家</td>
	                <td><input name="area" class="easyui-textbox" value="<s:property value="area"/>"/></td>
	            </tr>
	            <tr>
	                <td>语言</td>
	                <td><input name="language" class="easyui-textbox" value="<s:property value="language"/>"/></td>
	            </tr>
	            <tr>
	                <td>上映日期</td>
	                <td><input name="date" class="easyui-textbox" value="<s:property value="date"/>"/></td>
	            </tr>
	            <tr>
	                <td>片长</td>
	                <td><input name="time" class="easyui-textbox" value="<s:property value="time"/>"/></td>
	            </tr>
	            <tr>
	                <td>剧情简介</td>
	                <td><input name="introduction" value="<s:property value="introduction"/>" 
	                	class="easyui-textbox" style="width:400px; height:100px; multiline:true" /></td>
	            </tr>
			</s:iterator>
			<tr><td colspan="2"><s:actionerror/></td></tr>
	        <s:submit value="提交" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"/>       
	        </table>
	    </s:form>
	    <a href="lookMovie.action?pageNum=1" class="easyui-linkbutton" data-options="iconCls:'icon-back'" >返回</a>
	</div>
  </body>
</html>
