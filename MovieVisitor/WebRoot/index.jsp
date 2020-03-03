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
    
    <title>电影网首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script>
	 $(document).ready(function(){
	  $.ajax({
	            //几个参数需要注意一下
	                type: "POST",//方法类型
	                url: "index" ,//url
	                data:{
	                "hello":123
	                },
	                success: function (result) {
	               		
	                },
	                error : function() {
	                    alert("异常！");
	                }
	            });
	  })
	</script>
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
	
	<div>
    <!-- 图片滑动 -->
    <div id="carousel-example-generic" class="carousel slide tupiangudong center-block" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>


        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="images/img1.jpg" alt="..." class="center-block gunimg"><!-- center-block居中 -->
                <div class="carousel-caption">
                    <h3>复仇者联盟3:无限战争</h3>
                </div>
            </div>
            <div class="item">
                <img src="images/img2.jpeg" alt="..." class="center-block gunimg">
                <div class="carousel-caption">
                    <h3>头号玩家</h3>
                </div>
            </div>
        </div>

        <!-- 图片滑动Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>

    <!--热映电影-->
    <div class="reying">
        <!--文字-->
        <div class="row">
            <h4>正在热映</h4>
            <p><a href="onshowMovie.action">全部正在热映>></a></p>
        </div>
        <!--电影div-->
        <div class="row">
        	<s:iterator value="#session.onshowMovieList">
            <div class="thumbnail reying_movie">
                <a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>">
                <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" alt="..." width="120px" height="180px"></a>
                <div class="caption">
                    <h4><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></h4>
                    <p>评分:<s:property value="score"/></p>
                    <p><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>" class="btn btn-primary" role="button">在线观看</a></p>
                </div>
            </div>
			</s:iterator>
        </div>
    </div>

    <!--热门电影-->
    <div class="remen">
        <!--文字-->
        <div>
            <h4>热门电影</h4>
            <p><a href="allMovie.action?pageNum=1">更多>></a></p>
        </div>
        <!--电影div-->
        <div class="row">
        	<s:iterator value="#session.remenMovieList">
            <div class="thumbnail remen_movie">
                <a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>">
                <img src="http://localhost:8080/MovieWeb/image/movieImage/<s:property value="picture"/>" alt="..." width="120px" height="180px"></a>
                <div class="caption">
                    <h4><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></h4>
                    <p>评分:<s:property value="score"/></p>
                </div>
            </div>
            </s:iterator>
        </div>
    </div>

    <!--右侧口碑榜-->
    <div class="koubei">
        <h3>本月口碑榜</h3>
        <!--排行-->
        <div>
          <s:iterator value="#session.movieYueList" status="i">
         	<p style="font-size:25px"><span><s:property value="#i.index+1"/>.</span><a href="findMovieDianJi.action?moviename=<s:property value="moviename"/>"><s:property value="moviename"/></a></p>
          </s:iterator>
        </div>
    </div>

    <!--尾部-->
    <br/>
    <hr/>
    <div class="wei">
        <p>网站建立者：吕航</p>
        <p>合作邮箱：9999@qq.com</p>
    </div>
</div>
  </body>
</html>
