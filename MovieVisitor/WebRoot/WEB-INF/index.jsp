<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<script src="js/jquery-1.11.3.min.js"></script> 
<script src="js/jquery-1.11.3.js"></script> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:text name="个人信息管理系统"></s:text></title>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
     
      <div class="logo11" >
	      <h1><a href="#" title="Welcome to the stacks">水果商城</a></h1>
	     <p>Welcome to the stacks</p>
       </div>
       <img src="image/772.jpg" alt="图像" width="200" height="60"border="1"align="center"> 
           <hr noshade/>
            <s:div  align="center">
            
   
      <table border="0" cellspacing="0" cellpadding="0" width="90%" align="center">
          <tr>       		
    		<td width="10%">
			<s:iterator value="#session.username" var="user">
				欢迎：<s:property value="#user.username"/>使用！
				</s:iterator>
    		</td>
    		<td width="10%">
				<a href="index.jsp"><font color="yellow">退出</font></a>
    		</td>
          </tr>
      </table>
     
      </s:div>
      <style type="text/css">
       body{
          background:url(image/14.jpg);
       }
       </style>
      <hr noshade/>
      
      <s:div  align="center">
    
      <table border="0" cellspacing="0" cellpadding="0" width="90%" align="center">
          <tr>
          
            
			<td width="100%">
			<form action="findAction" method="post">
			 <input type="text" size="10"  name="find"/>           
			<input type="submit"  value="模糊查询"/>
			</form>   			
    		</td>
    		
    		
          </tr>
      </table>
     
      </s:div>
      <hr noshade/>
      					
<s:iterator value="#session.fruitinfo" var="fruit">
<table border="5" cellspacing="0" cellpadding="0" bgcolor="#95BDFF" width="60%" align="center">

                       <tr>
                       	 <td height="30"><s:text name="水果图片"></s:text></td>
                         <td height="30"><s:text name="商品名"></s:text></td>
                         <td height="30"><s:text name="水果价格"></s:text></td>
                         <td height="30"><s:text name="库存"></s:text></td>
                         <td height="30"><s:text name="产地"></s:text></td>             
                       </tr>
                       <tr>
                        <td><img src="<s:property value="#user.frupicture"/>" title="水果信息" style="width: 100px;height: 120px;"/></td>
                        <td><s:property value="#fruit.fruname"/></td>
                        <td><s:property value="#fruit.price"/></td>
                        <td><s:property value="#fruit.inventory"/></td>
                        <td><s:property value="#fruit.area"/></td>
                       </tr>
                    
        </table>
        
       </s:iterator>
    <s:include value="IncludeBottom.jsp"></s:include>
 </body>
 <script>
 $(document).ready(function(){
  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                url: "youraction" ,//url
                data:{
                "123":123
                },
                success: function (result) {
               
                },
                error : function() {
                    alert("异常！");
                }
            });
  })
 </script>
</html>
