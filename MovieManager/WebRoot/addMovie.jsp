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
    
    <title>My JSP 'addMovie.jsp' starting page</title>
   	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
     <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
    
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
  <br><br>
    <s:form action="addMovie" method="post" enctype="multipart/form-data">
           <table align="center" width="50%" border="1px" id="table">
               <tr>
                  	<s:textfield name="moviename" label="电影名" maxLength="16"/>
                  
                  	<s:textfield name="author" label="导演" maxLength="16"/>
			
					<s:checkboxlist name="type" label="类型"
                      list="#{'剧情':'剧情','爱情':'爱情','喜剧':'喜剧','科幻':'科幻','动作':'动作',
                      '悬疑':'悬疑','犯罪':'犯罪','恐怖':'恐怖','战争':'战争','惊悚':'惊悚','灾难':'灾难'}" />  
			
			   		<s:select name="area" 
                       list="#{'中国':'中国','美国':'美国','日本':'日本','韩国':'韩国','俄罗斯':'俄罗斯',
                       '英国':'英国','法国':'法国','德国':'德国','西班牙':'西班牙','意大利':'意大利','印度':'印度','泰国':'泰国',
                       '加拿大':'加拿大','墨西哥':'墨西哥','瑞典':'瑞典'}" 
                       label="制片国家" headerKey="-1" headerValue="---请选择国家---" emptyOption="true"/> 
                  	<s:select name="language" 
                       list="#{'汉语':'汉语','英语':'英语','日语':'日语','俄语':'俄语','法语':'法语',
                       '韩语':'韩语','德语':'德语','西班牙语':'西班牙语','意大利语':'意大利语','印度语':'印度语','泰语':'泰语'}" 
                       label="语言" headerKey="-1" headerValue="---请选择---" emptyOption="true"/> 

                  	<td>上映日期</td>
                  	<td>
                      <input name="date" class="Wdate" type="text" onClick="WdatePicker()"/>
					</td>
                   	<s:textfield name="time" label="片长" maxLength="16"/>
                   
                   	<s:textarea name="introduction" label="剧情简介" rows="8" cols="80" />
                   
                  	<s:file name="upload" label="上传图片"/>
                 </tr>
                 <tr><td colspan="2"><s:actionerror/></td></tr>
                 <tr>
                	<s:submit value="提交"/>
                	<s:reset value="清除"/>
                </tr>
               
           </table>
        </s:form>
  </body>
</html>
