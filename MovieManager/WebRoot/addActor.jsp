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
    
    <title>My JSP 'addActor.jsp' starting page</title>
       	<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css"/>
    <script src="js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"/><!-- 加载按钮小图标-->
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
    
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

  </head>
  
  <body>
  	<br><br><br>
     <s:form action="addActor" method="post" enctype="multipart/form-data">
            <table align="center" width="35%" border="1px" id="table">
                <tr>
                    <s:textfield name="name" label="演员名" maxLength="16"/>
                    
					<s:select name="sex" 
                         list="#{'男':'男','女':'女'}" 
                         label="性别" headerKey="-1" headerValue="---请选择性别---" emptyOption="true"/> 
                         
                    <s:select name="country" 
                         list="#{'中国':'中国','美国':'美国','日本':'日本','韩国':'韩国','英国':'英国',
                         '法国':'法国','德国':'德国','西班牙':'西班牙','意大利':'意大利','印度':'印度','泰国':'泰国',
                         '加拿大':'加拿大','墨西哥':'墨西哥','瑞典':'瑞典'}" 
                         label="国籍" headerKey="-1" headerValue="---请选择国家---" emptyOption="true"/> 

                    <td>出生日期</td>
                    <td>
                        <input name="birth" class="Wdate" type="text" onClick="WdatePicker()"/>
					</td>
                    <s:file name="upload" label="上传图片"/>
                </tr>
                <tr><td colspan="2"><s:actionerror/></td></tr>
                <tr>
                	<s:submit colspan="2" value="提交"/>
				    <s:reset colspan="1" value="清除"/>
                </tr>
            </table>
        </s:form>
  </body>
</html>
