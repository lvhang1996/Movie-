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
    
    <title>热映电影</title>
    
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
        .all_movie{
            margin-top: 100px;
            position: absolute;
            left: 20%;
            width: 60%;
        }

        .bottom{
            padding: 20px;
            top: 100px;
            width: 1000px;
        }
        .one_movie{
            position: relative;
            height: 280px;
            width: 150px;
            float: left;
            margin-right: 20px;
            margin-top: 20px;
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
<div class="all_movie">
	<br/>
    <h2 class="modal-title" style="color: green">热映电影</h2>
    <br/>
    <div class="bottom">
        <s:iterator value="#session.onshowMovieList">
            <div class="one_movie">
                <a href="oneMovie.action?id=<s:property value="id"/> & moviename=<s:property value="moviename"/>"> 
                <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" width="150px" height="200px"></a>
                <a href="oneMovie.action?id=<s:property value="id"/> & moviename=<s:property value="moviename"/>">
                <s:property value="moviename"/></a>
                <a href="oneMovie.action?id=<s:property value="id"/> & moviename=<s:property value="moviename"/>"
                 class="btn btn-lg btn-success">进入购票观影</a>
            </div>
        </s:iterator>
    </div>
    
</div>
  </body>
</html>
