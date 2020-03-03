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
    
    <title>电影网</title>
    
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
        h3{
            position: relative;
            margin-top: 20px;
        }
        .all{
            top: 150px;
            position: absolute;
            left: 25%;
            width: 50%;
            padding: 20px;
        }
        .movie{
            position: relative;
            left: 50px;
            width: 600px;
            height: 200px;
            padding: 10px;
        }
        .actor{
            position: relative;
            left: 50px;
            width: 600px;
            height: 200px;
        }
        .left{
            position: relative;
            float: left;
            width: 120px;
            height: 160px;
        }
        .right{
            position: relative;
            top: 20px;
            left: 80px;
            height: 160px;
            width: 350px;
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
    <h3>结果为电影的为:</h3>
    <s:iterator value="#session.findMovieList">
        <div class="movie">
            <div class="left">
            <a href="oneMovie.action?id=<s:property value="id"/> & moviename=<s:property value="moviename"/>">
                 <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" width="100px" height="150px" alt=""/>
            </a>
            </div>
            <div class="right">
                <h4>电影名:<a href="oneMovie.action?id=<s:property value="id"/> & moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></h4>
                <p style="color: green">评分:<s:property value="score"/></p>
                <p style="font-size: 15px">制片国家:<s:property value="area"/></p>
            </div>
            <hr/>
        </div>

    </s:iterator>
    <h3 >结果为演员的为:</h3>
    <s:iterator value="#session.findActorList">
        <div class="actor">
            <div class="left">
            	<a href="oneActor.action?id=<s:property value="id"/>&actorname=<s:property value="name"/>">
                 <img src="http://localhost:8080/MovieWeb/image/actorImage/<s:property value="picture"/>" 
                 class="img-circle" width="100px" height="150px" alt=""/></a>
            </div>
            <div class="right">
               <h4>演员: <a href="oneActor.action?id=<s:property value="id"/>&actorname=<s:property value="name"/>"><s:property value="name"/></a></h4>
                <p>性别:<s:property value="sex"/></p>
            </div>
            <hr/>
        </div>
    </s:iterator>
</div>
  </body>
</html>
