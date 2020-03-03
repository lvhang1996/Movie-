<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>基本设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
    	body{
    		padding:100px;
    	}
        .visitor_update_left{
            position: absolute;
            top: 100px;
            width: 35%;
            left: 15%;
            height: 600px;
        }
        .visitor_update_right{
            position: absolute;
            top: 200px;
            width: 20%;
            right: 25%;
        }
        .wei{
            right: 40%;
            text-align: center;
            position: absolute;
            bottom: 20px;
        }
        table td{
            height: 50px;
            font-size: 20px;
        }
    </style>

</head>

<body>
	<a class="btn btn-success btn-lg" style="font-size: 20px" href="index.jsp"> << 返回主页  </a>
<div class="visitor_update_left">
    <h3 class="modal-title">基本设置</h3>
    <br/>
    <img src="images/kuai.jpg" alt="" width="600px" height="50px"/>
    <br/>
    <s:form action="visitorUpdate" method="post" enctype="multipart/form-data">
        <table>
            <s:iterator value="#session.updateVisitorList" id="v">
                <s:hidden name="id" value="%{#v.id}"/>
                <s:hidden name="username" value="%{#v.username}"/>
                <s:hidden name="password" value="%{#v.password}"/>
                <s:hidden name="picture" value="%{#v.picture}"/>
                <s:hidden name="money" value="%{#v.money}"/>
                <tr>
                    <td>昵称：</td>
                    <td><input name="nickname" width="20px" value="<s:property value="nickname"/>"/></td>
                </tr>
                <tr>
                    <td>								
                        <img src="http://localhost:8080/MovieVisitor/images/visitorImage/<s:property value="picture"/>" width="100" height="120">
                    </td>
                 </tr>
                 <tr>
                    <td>
                      	  更改电影图片<s:file name="upload" label="上传图片"/>
                    </td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td><input name="email" width="20px" value="<s:property value="email"/>"/></td>
                </tr>
                <tr>
                    <td>手机号：</td>
                    <td><input name="ipone" width="20px" value="<s:property value="ipone"/>"/></td>
                </tr>
                <tr>
                    <td>登录密码</td>
                    <td><a href="findUpdateVisitorPassword.action?id=<s:property value="#session.vId"/>">点击更改</a></td>
                </tr>
            </s:iterator>
            <tr><td colspan="2"> <span style="color :red"><s:actionerror/></span></td></tr>
        </table>
        <button type="submit" class="btn btn-success">更新设置</button>
    </s:form>
</div>
<div class="visitor_update_right" style="font-size: 15px">
    <br/>
    <a href="index.jsp">>>返回到主页</a>
    <br/><br/><br/><br/>
    <a type="button" class="btn" data-toggle="modal" data-target="#delete">>>删除账号</a>
</div>

<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">删除账号</h4>
            </div>
            <div class="modal-body">
                <h2>你要知道，删除后：</h2>
                <p>这个帐号不可恢复</p>
                <br/>
                <p>你的私有数据将被永久删除，建议做好备份</p>
                <br/>
                <p>帐号所绑定的邮箱、或手机号，将不能再次用于注册或绑定其他帐号</p>
                <br/>
                <p>我的钱包余额，将无法在线申请提现</p>
                <br/>
                <a href="visitorDelete.action?id=<s:property value="#session.vId"/>&nickname=<s:property value="#session.vNickname"/>"> >>我想好了，我要删除  </a>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">放弃删除</button>
            </div>
        </div>
    </div>
</div>

<div class="wei">
    <hr/>
    <img src="images/bottom.png" alt=""/>
    <p>网站建立者：吕航</p>
    <p>合作邮箱：9999@qq.com</p>
</div>


</body>
</html>
