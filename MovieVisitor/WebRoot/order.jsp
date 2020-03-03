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
    
    <title>排行榜</title>
    
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
            padding: 50px;
        }
        .all{
            top: 150px;
            position: absolute;
            left: 15%;
            width: 70%;
            height: 700px;
        }
        .order{
            position: relative;
            float: left;
            margin: 50px;
            width: 250px;
            border: 2px solid;
            border-left-color: white;
            border-top-color: white;
            border-bottom-color: white;
            border-right-color: green;
            padding: 50px;
        }
        p{
            font-size: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
        <!-- 第一栏-->
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">电影网</a>
            </div>
            <div class="collapse navbar-collapse">
                <form class="navbar-form navbar-left" action="find" method="post">
                    <div class="form-group">
                        <input name="findName" size="15" style="width:200px" class="form-control" placeholder="查找电影、演员">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <s:if test='#session.login=="1"'>
                <ul class="nav navbar-nav navbar-right">
                	<li><img class="img-circle" src="http://localhost:8080/MovieVisitor/images/visitorImage/<s:property value="#session.vPicture"/>" width="40px" height="40px"></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"><s:property value="#session.vNickname"/>的账号 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="center.action?nickname=<s:property value="#session.vNickname"/>">个人中心</a></li>
                            <li><a href="qianbao.action?nickname=<s:property value="#session.vNickname"/>">我的钱包</a></li>
                            <li><a href="findUpdateVisitor.action?id=<s:property value="#session.vId"/>">账号管理</a></li>
                            <li role="separator" class="divider"></li><!--分割线-->
                            <li><a href="out.action">退出</a></li>
                        </ul>
                    </li>
                </ul>
                </s:if>
                <s:else>
                 <ul class="nav navbar-nav navbar-right">
	                <li><a href="login.jsp" type="button" class="btn" >登录</a></li>
	                <li><a href="register.jsp" type="button" class="btn">注册</a></li>
	            </ul>
	            </s:else>
            </div>
        </div>
        <!-- 第二栏-->
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="allMovie.action?pageNum=1">全部电影</a></li>
                    <li><a href="order.action">排行榜</a></li>
                    <li><a href="allActor.action?pageNum=1">演员</a></li>
                    <li><a href="onshowMovie.action">热映电影</a></li>
                </ul>
            </div>
        </div>
    </nav>
<div class="all">
    <div class="left">
        <div class="order">
            <h3>口碑总榜</h3>
             <s:iterator value="#session.movieGoodList" status="i">
            	<p><span><s:property value="#i.index+1"/>.</span><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></p>
             </s:iterator>
        </div>
        <div class="order">
            <h3>口碑最差榜</h3>
            <s:iterator value="#session.movieBadList" status="i">
            	<p><span><s:property value="#i.index+1"/>.</span><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></p>
             </s:iterator>
        </div>
        <div class="order">
            <h3>本月口碑榜</h3>
            <s:iterator value="#session.movieYueList" status="i">
            	<p><span><s:property value="#i.index+1"/>.</span><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></p>
             </s:iterator>
        </div>
        <img src="images/rightpic.jpg" style="position:relative;float: left;margin-top: 300px" alt="" width="230px" height="250px"/>
    </div>
</div>
  </body>
</html>
